-- Index Toolinstall descript

spool ./logs/deinstall.log 
set echo off

--Global Config
@install_global_config

--Schema setup
conn &adminconn.


pause You are about to drop &appschemaname. schema. All data will be lost. Press Ctrl-C to interrupt or any key to continue...
set echo on
drop user &appschemaname. cascade;
  
spool off
set echo off