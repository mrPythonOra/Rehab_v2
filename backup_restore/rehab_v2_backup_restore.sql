set verify off

spool /home/opc/rehab_backup_restore/rehab_v2_backup_restore.log
prompt =========================================
prompt Backup ==================================
prompt =========================================

@&1.

set cloudconfig &SRC_WALLET_NAME.
conn &SRC_CONNECT_STRING.

variable LOG_ID NUMBER;
variable IMPORT_STATUS VARCHAR2(128);
variable FILENAME varchar2(1000);

-- Setup the backup log table to track export and import operations
CREATE TABLE if NOT EXISTS BACKUP_REHAB_V2_LOG 
  ( LOG_ID NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL ENABLE, 
    TERMINAL VARCHAR2(1000 BYTE), 
    TS_START TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp, 
    TS_END TIMESTAMP (6) WITH TIME ZONE, 
    EXPORT_STATUS VARCHAR2(128 BYTE), 
    IMPORT_STATUS VARCHAR2(128 BYTE),
    FILENAME VARCHAR2(4000 BYTE), 
    ERRORMSG VARCHAR2(4000 BYTE), 
    FILE_STATUS VARCHAR2(100 BYTE) DEFAULT 'ON STORAGE', 
    CONSTRAINT PK_BACKUP_REHAB_V2_LOG PRIMARY KEY (LOG_ID));
grant select on BACKUP_REHAB_V2_LOG to &SRC_SCHEMA.;
create or replace synonym &SRC_SCHEMA..BACKUP_REHAB_V2_LOG for BACKUP_REHAB_V2_LOG;

prompt =========================================
set serveroutput on
DECLARE
  hdl           NUMBER;       -- Data Pump job handle
  job_state     VARCHAR2(30); -- Variable to store job final status
  
  -- The OCI Object Storage URI template with a wildcard (%U) for file parts
  dump_file_uri VARCHAR2(500) := '&SRC_BASKET_PATH.&SRC_BACKUP_PREFIX._<DT>.dmp';
  
  -- The target schema you want to back up
  target_schema VARCHAR2(30)  := '&SRC_SCHEMA.';
  
  -- Name of the database credential created via DBMS_CLOUD
  cred_name     VARCHAR2(30)  := '&SRC_CRED_NAME.';
  
  l_log_id BACKUP_REHAB_LOG.log_id%type;
BEGIN

  dump_file_uri := replace(dump_file_uri, '<DT>', to_char(sysdate, 'YYYYMMDDHH24MI'));
  
  :FILENAME := dump_file_uri;

  INSERT INTO BACKUP_REHAB_V2_LOG (log_id, ts_start, FILENAME, terminal) 
    VALUES ( default, default, dump_file_uri, SYS_CONTEXT ('USERENV', 'OS_USER')||'@'||SYS_CONTEXT ('USERENV', 'HOST')) returning log_id into l_log_id;
  commit;

  :LOG_ID := l_log_id;

  -- 1. Open a new Schema-level Export job
  hdl := DBMS_DATAPUMP.OPEN(
    operation => 'EXPORT',
    job_mode  => 'SCHEMA',
    job_name  => 'SCHEMA_CLOUD_EXPORT'
  );

  -- 2. Add the Dump File targeting the OCI Object Storage Bucket
  -- Note: Use DBMS_DATAPUMP.KU$_FILE_TYPE_URIDUMP_FILE (or filetype => 1) for cloud URIs
  DBMS_DATAPUMP.ADD_FILE(
    handle    => hdl,
    filename  => dump_file_uri,
    directory => cred_name, -- Pass the credential name directly here as the directory
    filetype  => DBMS_DATAPUMP.KU$_FILE_TYPE_URIDUMP_FILE --,
    --filesize  => '1G'       -- Ensures file parts do not exceed OCI thresholds
  );

  -- 3. Add a local Log File (Logs cannot write directly to the cloud pipe)
  DBMS_DATAPUMP.ADD_FILE(
    handle    => hdl,
    filename  => '&SRC_EXP_LOG_FILE.',
    directory => 'DATA_PUMP_DIR', -- A valid, local database directory object
    filetype  => DBMS_DATAPUMP.KU$_FILE_TYPE_LOG_FILE
  );

  -- 4. Apply a metadata filter to isolate the specific schema
  DBMS_DATAPUMP.METADATA_FILTER(
    handle => hdl,
    name   => 'SCHEMA_EXPR',
    value  => 'IN (''' || target_schema || ''')'
  );

  -- 5. Set supplementary job parameters
  DBMS_DATAPUMP.SET_PARAMETER(handle => hdl, name => 'ESTIMATE', value => 'BLOCKS');

  -- 6. Start the job execution
  DBMS_DATAPUMP.START_JOB(handle => hdl);

  -- 7. Wait for the job to complete and display its outcome
  DBMS_DATAPUMP.WAIT_FOR_JOB(handle => hdl, job_state => job_state);
  DBMS_OUTPUT.PUT_LINE('Data Pump Job Completed with status: ' || job_state);

  -- 8. Cleanly detach from the job handle
  DBMS_DATAPUMP.DETACH(handle => hdl);

  update BACKUP_REHAB_V2_LOG set EXPORT_STATUS = job_state, TS_END = systimestamp where log_id = l_log_id;
  commit;
  
EXCEPTION
  WHEN OTHERS THEN
    -- In case of failure, ensure we try to detach from the handle to avoid lock states
    update BACKUP_REHAB_V2_LOG set EXPORT_STATUS = 'FAILED', TS_END = systimestamp, ERRORMSG = DBMS_UTILITY.FORMAT_ERROR_STACK where log_id = l_log_id;
    commit;     
    IF hdl IS NOT NULL THEN
       DBMS_DATAPUMP.DETACH(handle => hdl);
    END IF;
    RAISE;
END;
/

select * from BACKUP_REHAB_V2_LOG order by log_id;

prompt =========================================
prompt Cleanup =================================
prompt =========================================

set serveroutput on
DECLARE
  v_cred_name   VARCHAR2(30)  := '&SRC_CRED_NAME.';
  -- Base URL pointing to the virtual folder inside your OCI bucket
  v_folder_uri  VARCHAR2(500);
  l_suffix      varchar2(100) := '_segments/';
BEGIN
    for files in (select x.*
                    from (select z.*, row_number() over (order by log_id desc) rn 
                            from BACKUP_REHAB_V2_LOG z
                           where FILE_STATUS = 'ON STORAGE' 
                             and EXPORT_STATUS = 'COMPLETED' ) x
                   where TS_END < SYSTIMESTAMP - INTERVAL '&BACKUP_RETENTION_DAYS.' DAY 
                     and rn > &BACKUP_RETENTION_DAYS.
                     order by log_id)
    loop
      -- 1. Loop through all files that exist inside the specified folder path
      v_folder_uri := files.FILENAME;
      FOR r IN (
        SELECT object_name 
        FROM table(DBMS_CLOUD.LIST_OBJECTS(credential_name => v_cred_name, location_uri => v_folder_uri || l_suffix))
      ) LOOP
        -- 2. Delete each individual file found inside the folder
        DBMS_CLOUD.DELETE_OBJECT(
          credential_name => v_cred_name,
          object_uri      => v_folder_uri || l_suffix || r.object_name
        );
        DBMS_OUTPUT.PUT_LINE('Deleted: ' || v_folder_uri || l_suffix || r.object_name);
      END LOOP;
      DBMS_CLOUD.DELETE_OBJECT(
          credential_name => v_cred_name,
          object_uri      => v_folder_uri
        );   
      DBMS_OUTPUT.PUT_LINE('Deleted: ' || v_folder_uri );

      update BACKUP_REHAB_V2_LOG set FILE_STATUS = 'DELETED at '||to_char(systimestamp,'YYYY-MON-DD HH24:MI:SS TZH:TZM') where log_id=files.log_id;
      commit;
      DBMS_OUTPUT.PUT_LINE('Virtual folder '||v_folder_uri || l_suffix||' and all contents successfully removed.');      
    end loop;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error cleaning bucket folder: ' || SQLERRM);
    RAISE;
END;
/

select * from BACKUP_REHAB_V2_LOG order by log_id;
--==================================================================================================
--==================================================================================================
--==================================================================================================

prompt =========================================
prompt Restore =================================
prompt =========================================

set cloudconfig &TRG_WALLET_NAME.
conn &TRG_CONNECT_STRING.

-- Setup the backup log table to track export and import operations
CREATE TABLE if NOT EXISTS BACKUP_REHAB_V2_LOG 
  ( LOG_ID NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL ENABLE, 
    TERMINAL VARCHAR2(1000 BYTE), 
    TS_START TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp, 
    TS_END TIMESTAMP (6) WITH TIME ZONE, 
    EXPORT_STATUS VARCHAR2(128 BYTE), 
    IMPORT_STATUS VARCHAR2(128 BYTE),
    FILENAME VARCHAR2(4000 BYTE), 
    ERRORMSG VARCHAR2(4000 BYTE), 
    FILE_STATUS VARCHAR2(100 BYTE) DEFAULT 'ON STORAGE', 
    CONSTRAINT PK_BACKUP_REHAB_V2_LOG PRIMARY KEY (LOG_ID));
--grant select on BACKUP_REHAB_V2_LOG to &TRG_SCHEMA.;
--create or replace synonym &TRG_SCHEMA..BACKUP_REHAB_V2_LOG for BACKUP_REHAB_V2_LOG;

prompt Cleaning up schema ======================
set serveroutput on
BEGIN
  -- Drop existing package specs and bodies in the target schema
  FOR r IN (
    SELECT owner, object_name, object_type 
    FROM all_objects 
    WHERE owner = '&TRG_SCHEMA.' 
      AND object_type IN ('PACKAGE', 'PACKAGE BODY', 'PROCEDURE', 'FUNCTION', 'VIEW', 'SEQUENCE', 'SYNONYM')
  ) LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DROP ' || r.object_type || ' ' || r.OWNER || '.' || r.object_name;
    EXCEPTION
      WHEN OTHERS THEN NULL; -- Ignore drop errors if dependent objects were already dropped
    END;
  END LOOP;
END;
/
prompt Schema is cleaned ======================

declare
  hdl           NUMBER;       -- Data Pump job handle
  job_state     VARCHAR2(30); -- Variable to store the job's final status
  
  -- The exact OCI Object Storage URI template with wildcard (%U) used during export
  dump_file_uri VARCHAR2(500) := '&SRC_BASKET_PATH.&SRC_BACKUP_PREFIX._<DT>.dmp';
  
  -- Name of the database credential created via DBMS_CLOUD
  cred_name     VARCHAR2(30)  := '&TRG_CRED_NAME.';
  
  l_log_id restore_rehab_log.log_id%type;
BEGIN
  --dump_file_uri := replace(dump_file_uri, '<DT>', to_char(sysdate, 'YYYYMMDD'));

  dump_file_uri := :FILENAME;

  INSERT INTO BACKUP_REHAB_V2_LOG (log_id, ts_start, FILENAME, terminal) 
    VALUES ( default, default, dump_file_uri, SYS_CONTEXT ('USERENV', 'OS_USER')||'@'||SYS_CONTEXT ('USERENV', 'HOST')) returning log_id into l_log_id;
  commit;
  
  -- 1. Open a new Schema-level Import job
  hdl := DBMS_DATAPUMP.OPEN(
    operation => 'IMPORT',
    job_mode  => 'SCHEMA',
    job_name  => 'SCHEMA_CLOUD_IMPORT1'
  );

  -- 2. Add the source Dump File targeting your OCI Object Storage Bucket
  DBMS_DATAPUMP.ADD_FILE(
    handle    => hdl,
    filename  => dump_file_uri,
    directory => cred_name, -- Pass the credential name directly here as the directory
    filetype  => DBMS_DATAPUMP.KU$_FILE_TYPE_URIDUMP_FILE
  );

  -- 3. Add a local Log File to track the operation
  DBMS_DATAPUMP.ADD_FILE(
    handle    => hdl,
    filename  => '&TRG_IMP_LOG_FILE.',
    directory => 'DATA_PUMP_DIR', 
    filetype  => DBMS_DATAPUMP.KU$_FILE_TYPE_LOG_FILE
  );

  -- 4. Remap the schema from REABILITATION to REHAB_TARGET
  DBMS_DATAPUMP.METADATA_REMAP(
    handle    => hdl,
    name      => 'REMAP_SCHEMA',
    old_value => '&SRC_SCHEMA.',
    value     => '&TRG_SCHEMA.'
  );

  -- 5. Set the action for existing tables to REPLACE (drops and recreates them)
  DBMS_DATAPUMP.SET_PARAMETER(
    handle => hdl,
    name   => 'TABLE_EXISTS_ACTION',
    value  => 'REPLACE'
  );

  -- 6. Start the import job
  DBMS_DATAPUMP.START_JOB(handle => hdl);

  -- 7. Wait for completion and output the status
  DBMS_DATAPUMP.WAIT_FOR_JOB(handle => hdl, job_state => job_state);
  DBMS_OUTPUT.PUT_LINE('Data Pump Import Job Completed with status: ' || job_state);

  -- 8. Cleanly detach from the handle
  DBMS_DATAPUMP.DETACH(handle => hdl);
  :IMPORT_STATUS := job_state;
  update BACKUP_REHAB_V2_LOG set IMPORT_STATUS = job_state, TS_END = systimestamp where log_id = l_log_id;
  commit;
  
EXCEPTION
  WHEN OTHERS THEN
    -- Safeguard to prevent job lock states if the block fails prematurely
    update BACKUP_REHAB_V2_LOG set IMPORT_STATUS = 'FAILED', TS_END = systimestamp, ERRORMSG = DBMS_UTILITY.FORMAT_ERROR_STACK where log_id = l_log_id;
    commit;    
    IF hdl IS NOT NULL THEN
       DBMS_DATAPUMP.DETACH(handle => hdl);
    END IF;
    RAISE;
END;
/

grant select on BACKUP_REHAB_V2_LOG to &TRG_SCHEMA.;
create or replace synonym &TRG_SCHEMA..BACKUP_REHAB_V2_LOG for BACKUP_REHAB_V2_LOG;

prompt Schema post_actions ======================
@&POST_ACTIONS.

select * from BACKUP_REHAB_V2_LOG order by log_id;

set cloudconfig &SRC_WALLET_NAME.
conn &SRC_CONNECT_STRING.

update BACKUP_REHAB_V2_LOG set IMPORT_STATUS = :IMPORT_STATUS where log_id = :LOG_ID;
commit;
disc

spool OFF

exit
