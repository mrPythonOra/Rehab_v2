#!/bin/bash

##0 3 * * * /home/opc/rehab_backup_restore/rehab_backup_restore.sh >> /home/opc/rehab_backup_restore/cron_output.log 2>&1

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/sqlcl/bin

export PATH

export JAVA_HOME=/home/opc/jdk-21.0.11

sql /nolog @/home/opc/rehab_backup_restore/rehab_backup_restore.sql
