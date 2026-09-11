@&1.
set timing off
define COREMODPATH="..\database\source\\"

rem ...

set heading off
set feedback off
rem set termout OFF
set trimspool on
set lines 5000
rem set long 1000
rem set wrap off
set pages 0
set echo off
set verify off

spool _tmp_get_src.sql
prompt SET LONG 2000000 LONGCHUNKSIZE 2000000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY OFF TRIMSPOOL ON
prompt BEGIN
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);;
prompt    -- Uncomment the following lines if you need them.
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SPECIFICATION', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'BODY', false);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'EMIT_SCHEMA', FALSE);;
prompt END;;
prompt /

select 
'spool &COREMODPATH.'||object_name||'_SPEC.SQL'||chr(10)||
'prompt '||chr(10)||
--replace(replace(q'[SELECT replace(replace(DBMS_METADATA.get_ddl ('<TYPE>', '<NAME>', user),'"'),user||'.') txt FROM  dual;]','<TYPE>',object_type),'<NAME>',object_name)||chr(10)||
replace(replace(q'[SELECT DBMS_METADATA.get_ddl ('<TYPE>', '<NAME>', user) txt FROM  dual;]','<TYPE>',object_type),'<NAME>',object_name)||chr(10)||
'prompt '||chr(10)||
'spool off'
from user_objects 
where (object_type in ('PACKAGE','TYPE'))
--or object_type in ('TYPE')
order by object_type, object_name;

prompt BEGIN
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);;
prompt    -- Uncomment the following lines if you need them.
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SPECIFICATION', false);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'BODY', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'EMIT_SCHEMA', FALSE);;
prompt END;;
prompt /

select 
'spool &COREMODPATH.'||object_name||'_BODY.SQL'||chr(10)||
'prompt '||chr(10)||
--replace(replace(q'[SELECT replace(replace(DBMS_METADATA.get_ddl ('<TYPE>', '<NAME>', user),'"'),user||'.') txt FROM  dual;]','<TYPE>',replace(object_type,' BODY')),'<NAME>',object_name)||chr(10)||
replace(replace(q'[SELECT DBMS_METADATA.get_ddl ('<TYPE>', '<NAME>', user) txt FROM  dual;]','<TYPE>',replace(object_type,' BODY')),'<NAME>',object_name)||chr(10)||
'prompt '||chr(10)||
'spool off'
from user_objects 
where (object_type in ('PACKAGE BODY','TYPE BODY'))
--or object_type in ('TYPE BODY')
order by object_type, object_name;

prompt BEGIN
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);;
prompt    -- Uncomment the following lines if you need them.
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SPECIFICATION', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'BODY', true);;
prompt    DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'EMIT_SCHEMA', FALSE);;
prompt END;;
prompt /

select 
'spool &COREMODPATH.'||replace(object_name,'$','_')||'_'||replace(object_type,' ','_')||'.SQL'||chr(10)||
'prompt'||chr(10)||
--replace(replace(q'[SELECT replace(replace(DBMS_METADATA.get_ddl ('<TYPE>', '<NAME>', user),'"'),user||'.') txt FROM  dual;]','<TYPE>',object_type),'<NAME>',object_name)||chr(10)||
replace(replace(q'[SELECT DBMS_METADATA.get_ddl ('<TYPE>', '<NAME>', user) txt FROM  dual;]','<TYPE>',object_type),'<NAME>',object_name)||chr(10)||
'prompt'||chr(10)||
'spool off'
from user_objects 
where object_type in ( 'FUNCTION', 'PROCEDURE','TRIGGER') 
--and object_name not like 'ST0000%' and object_name not like 'GATHER_BT%' and object_name not like 'GET_BT%'
order by object_type, object_name;

spool off

@_tmp_get_src.sql

spool &COREMODPATH.\create_stored.sql

prompt set define off

--select 
--'@@'||replace(object_name,'$','_')||'_'||replace(object_type,' ','_')||'.SQL'||chr(10)||'show errors'||chr(10)
--from user_objects 
--where object_type in ( 'TYPE') --and object_name not like 'ST0000%'
--order by object_type, object_name;

select 
'@@'||object_name||'_SPEC.SQL'||chr(10)||'show errors'||chr(10)
from user_objects 
where (object_type in ('PACKAGE','TYPE'))
--or object_type in ('TYPE')
order by decode(object_type,'TYPE',0,1), object_name;

select 
'@@'||object_name||'_BODY.SQL'||chr(10)||'show errors'||chr(10)
from user_objects 
where  (object_type in ('PACKAGE BODY','TYPE BODY'))
--or object_type in ('TYPE BODY')
order by object_name;

select 
'@@'||replace(object_name,'$','_')||'_'||replace(object_type,' ','_')||'.SQL'||chr(10)||'show errors'||chr(10)
from user_objects 
where object_type in ( 'FUNCTION', 'PROCEDURE','TRIGGER')
--and object_name not like 'GATHER_BT%' and object_name not like 'GET_BT%'
order by object_type, object_name;

SELECT replace(replace(DBMS_METADATA.get_ddl ('SYNONYM', synonym_name, user),'"'),user||'.')||chr(10)||'/' txt
FROM   user_synonyms
;

prompt set define on

spool off

exit

--=============================================================================================
--=============================================================================================
--=============================================================================================

define COREMODPATH="..\modules\sql_trace\source\"

rem "


--=============================================================================================
--=============================================================================================
--=============================================================================================

define COREMODPATH="..\modules\ash_analyzer\source\"

rem "


--=============================================================================================
--=============================================================================================
--=============================================================================================

define COREMODPATH="..\modules\awr_warehouse\source\"

rem "


--=============================================================================================
--=============================================================================================
--=============================================================================================

define COREMODPATH="..\modules\db_growth\source\"

rem "


--=============================================================================================
--=============================================================================================
--=============================================================================================

