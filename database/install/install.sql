
set serveroutput on


@../database/structure/data_structure.sql
@../database/source/create_stored.sql

--Compiling PL/SQL source code
set pages 999
set lines 200

select * from user_errors order by 1,2,3,4,5;

begin
  dbms_utility.compile_schema(user);
end;
/

select * from user_errors order by 1,2,3,4,5;

@../database/data/REHAB_CONFIGS_DATA_TABLE.sql
@../database/data/REHAB_CONSUME_PATTERNS_DATA_TABLE.sql
@../database/data/REHAB_CONSUME_TIME_RANGES_DATA_TABLE.sql

commit;
