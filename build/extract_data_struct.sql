@&1.
set timing off
set heading off
set feedback off
spool data_structure.sql
SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY OFF TRIMSPOOL ON

BEGIN
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
   -- Uncomment the following lines if you need them.
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SEGMENT_ATTRIBUTES', true);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'STORAGE', false);
   --DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'LOB_STORAGE', 'NO_CHANGE');
$IF DBMS_DB_VERSION.ver_le_12_1  
$THEN   
   null;
$ELSE
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'COLLATION_CLAUSE', 'NEVER' );
$END    
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'TABLESPACE', false );
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'REF_CONSTRAINTS', false );
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'CONSTRAINTS_AS_ALTER', true );   
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'EMIT_SCHEMA', FALSE);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'TABLE_COMPRESSION_CLAUSE','NOCOMPRESS ');

END;
/

--tables
SELECT 
       replace(replace(replace(DBMS_METADATA.get_ddl ('TABLE', table_name, user)
       ,'4000 CHUNK 8192'),'8000 CHUNK 8192'),'TRANSPORTABLE') txt
FROM   user_tables 
--where (table_name like 'OPAS%' or table_name like 'PLAN_TABLE_EXT%')
order by table_name;

--constraints
SELECT DBMS_METADATA.get_ddl ('REF_CONSTRAINT', constraint_name, user) txt
FROM   user_constraints 
where constraint_type='R'
  --and (table_name like 'OPAS%' or table_name like 'PLAN_TABLE_EXT%')
order by table_name;

SELECT DBMS_METADATA.get_ddl ('INDEX', index_name, user) txt  
FROM   user_indexes 
where --(table_name like 'OPAS%' or table_name like 'PLAN_TABLE_EXT%')
  --and 
index_type not in ('LOB','IOT - TOP') and CONSTRAINT_INDEX = 'NO'
order by table_name,index_name;

--views
SELECT DBMS_METADATA.get_ddl ('VIEW', view_name, user) txt
FROM   user_views
where view_name like '%'
order by view_name;

--sequence
SELECT DBMS_METADATA.get_ddl ('SEQUENCE', sequence_name, user)||chr(10)||'alter sequence '||sequence_name||' restart;' txt
FROM   user_sequences
where sequence_name not like 'ISEQ$$%'
order by sequence_name;

spool off

spool data_structure_mv.sql
--mat views
SELECT replace(DBMS_METADATA.get_ddl ('MATERIALIZED_VIEW', mview_name, user),'USING ENFORCED CONSTRAINTS','--USING ENFORCED CONSTRAINTS') txt
FROM   user_mviews 
where mview_name like 'MV%'
order by decode(mview_name,'SDA_MV_ALL_TAB_STRUCTS',0,1), mview_name;

SELECT DBMS_METADATA.get_ddl ('INDEX', index_name, user) txt 
from user_indexes where table_name in (select container_name
FROM   user_mviews 
where mview_name like 'MV%'
  and index_type not in ('LOB'))
order by table_name, index_name;

spool off

exit
