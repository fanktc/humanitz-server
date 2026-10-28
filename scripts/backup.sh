
#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$(dirname "$(realpath "$0")")")

DATE=$(date +%Y%m%d_%H%M)

BACKUP_FILE="${PROJECT_DIR}/backups/humanitz_${DATE}.tar.gz"

echo "Creating backup..."

tar -czf \
"${BACKUP_FILE}" \
"${PROJECT_DIR}/config" \
"${PROJECT_DIR}/serverfiles/HumanitZServer/Saved"

echo "Backup created:"
echo "${BACKUP_FILE}"

if rclone lsd onedrive: >/dev/null 2>&1
then

    echo "Uploading backup to OneDrive..."

    source ~/.env

    rclone copy \
    "${BACKUP_FILE}" \
    "${ONEDRIVE_REMOTE}:/${ONEDRIVE_FOLDER}"

    echo "Upload completed."

else

    echo "Rclone not configured. Skipping OneDrive upload."

fi
