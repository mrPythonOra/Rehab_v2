sql /nolog @extract_data_struct %REHABILITATION%
move data_structure*.sql ..\database\structure\

sql /nolog @unload_data %REHABILITATION%
move SDA_CONFIG_DATA_TABLE.sql ..\database\data