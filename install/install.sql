-- Index Tool install script
-- Installation from scratch

spool ./logs/install.log 
set echo on

--Global Config
@install_global_config

--Schema setup
conn &adminconn.
set echo on
@schema_setup

--Database objects creation
conn &appconn.
set echo on
@../database/install/install.sql

spool off
set echo off