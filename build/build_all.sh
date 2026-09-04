rm -rf ../apex/f200
sql /nolog @extract_apex $REHAB20
mv -f f200 ../apex
mv -f f200.sql ../apex
sql /nolog @build_db_src $REHAB20
rm _tmp_get_src.sql
sql /nolog @extract_data_struct $REHAB20
mv -f data_structure*.sql ../database/structure/
sql /nolog @unload_data $REHAB20
mv -f *DATA_TABLE.sql ../database/data
