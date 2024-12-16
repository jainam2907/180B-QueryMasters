# Variables
BACKUP_DIR="/var/backups/media_streaming"
DB_USER="root"                            
DB_PASS="password"                    
DB_NAME="media_streaming"                 
DATE=$(date +"%Y%m%d_%H%M%S")             
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Perform the backup
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > "$BACKUP_FILE"

# Verify the backup
if [ $? -eq 0 ]; then
    echo "Backup successfully created: $BACKUP_FILE"
else
    echo "Backup failed!" >&2
    exit 1
fi