rmdir /S /Q ..\apex\f100
sql /nolog @extract_apex %REHABILITATION%
move f100 ../apex
move f100.sql ../apex

sql /nolog @build_db_src %REHABILITATION%
del _tmp_get_src.sql

sql /nolog @extract_data_struct %REHABILITATION%
move data_structure*.sql ..\database\structure\

sql /nolog @unload_data %REHABILITATION%
move *DATA_TABLE.sql ..\database\data