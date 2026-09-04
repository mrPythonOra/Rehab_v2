@&1.
set timing off
set feedback off

SET LOADFORMAT insert

unload CONFIGS

spool REHAB_CONSUME_PATTERNS_DATA_TABLE.sql
select /*insert*/ * from REHAB_CONSUME_PATTERNS where CP_PRNT_ID is null;
spool off

spool REHAB_CONSUME_TIME_RANGES_DATA_TABLE.sql
select /*insert*/ * from REHAB_CONSUME_TIME_RANGES where CPTR_CP_ID in (select CP_ID from REHAB_CONSUME_PATTERNS where CP_PRNT_ID is null);
spool off

spool REHAB_CONFIGS_DATA_TABLE.sql
select /*insert*/ * from REHAB_CONFIGS where PAR_TE_ID is null;
spool off
exit
