set define "&"
@rehab20
@@version.sql
@environment

define ISCLOUD=TRUE

set cloudconfig &OneDrive.\Wallets\&e_walletname
define dbtns=&e_dbtnsname

-- Rehabilitation App scheme and password
define appschemaname=&e_appschemaname
define appschemapwd=&e_appschemapwd

-- Tablespace name for Rehabilitation App
--ADB tablespace
define tblspc_name=DATA

-- Local Admin user
define adminuser=&e_adminuser
define adminuserpwd=&e_adminuserpwd

define adminconn="&adminuser./&adminuserpwd.@&dbtns."
define appconn="&appschemaname./&appschemapwd.@&dbtns."

SET SQLBLANKLINES ON
