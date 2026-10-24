define SRC_WALLET_NAME="/home/opc/wallets/Wallet_ODB2.zip"
define SRC_CONNECT_STRING="admin/KaraGandec$5#3084@odb2_high"

define SRC_BASKET_PATH="https://objectstorage.eu-frankfurt-1.oraclecloud.com/n/friclsqmc8ax/b/REHAB-Backups/o/"
define SRC_BACKUP_PREFIX="rehab_v2_backup"

define SRC_SCHEMA=REHAB_V2
define SRC_CRED_NAME=REHAB_BACKUP
define SRC_EXP_LOG_FILE="rehab_v2_export_cloud.log"

define BACKUP_RETENTION_DAYS=30

define TRG_WALLET_NAME="/home/opc/wallets/Wallet_DB26V1.zip"
define TRG_CONNECT_STRING="admin/RfhfUfyltw#4$8@db26v1_high"

define TRG_SCHEMA=REHAB_V2
define TRG_CRED_NAME=REHAB_BACKUP
define TRG_IMP_LOG_FILE="rehab_v2_import_cloud.log"

define POST_ACTIONS="/home/opc/rehab_backup_restore/rehab_v2_post.sql"