# Variables
BACKUP_FILE="/var/backups/media_streaming/media_streaming_backup.sql"
DB_USER="root"                                                       
DB_PASS="password"                                               
DB_NAME="media_streaming"                                            

# Restore the database
mysql -u $DB_USER -p$DB_PASS $DB_NAME < "$BACKUP_FILE"

# Verify the restore
if [ $? -eq 0 ]; then
    echo "Database successfully restored from: $BACKUP_FILE"
else
    echo "Restore failed!" >&2
    exit 1
fi