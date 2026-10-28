#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [ -z "$1" ]
then
    echo ""
    echo "Usage:"
    echo ""
    echo "    ./scripts/restore.sh backup.tar.gz"
    echo ""
    exit 1
fi

BACKUP_FILE="$1"

if [ ! -f "$BACKUP_FILE" ]
then
    echo ""
    echo "Backup file not found:"
    echo "    $BACKUP_FILE"
    echo ""
    exit 1
fi

TMP_DIR=$(mktemp -d)

echo ""
echo "===================================================="
echo " HumanitZ Restore"
echo "===================================================="
echo ""

echo "Stopping container..."

cd "${PROJECT_ROOT}/docker"

docker compose down

echo ""
echo "Extracting backup..."

tar -xzf "${BACKUP_FILE}" -C "${TMP_DIR}"

CONFIG_FILE=$(find "${TMP_DIR}" -name GameServerSettings.ini | head -1)

SAVE_DIR=$(find "${TMP_DIR}" -type d -path "*/HumanitZServer/Saved" | head -1)

if [ -z "${CONFIG_FILE}" ]
then
    echo "GameServerSettings.ini not found in backup."
    exit 1
fi

if [ -z "${SAVE_DIR}" ]
then
    echo "Saved directory not found in backup."
    exit 1
fi

echo ""
echo "Restoring configuration..."

mkdir -p "${PROJECT_ROOT}/config"

cp "${CONFIG_FILE}" \
   "${PROJECT_ROOT}/config/GameServerSettings.ini"

echo ""
echo "Restoring save files..."

mkdir -p \
"${PROJECT_ROOT}/docker/serverfiles/HumanitZServer/Saved"

rm -rf \
"${PROJECT_ROOT}/docker/serverfiles/HumanitZServer/Saved"

mkdir -p \
"${PROJECT_ROOT}/docker/serverfiles/HumanitZServer/Saved"

cp -a \
"${SAVE_DIR}/." \
"${PROJECT_ROOT}/docker/serverfiles/HumanitZServer/Saved/"

echo ""
echo "Starting server..."

cd "${PROJECT_ROOT}/docker"

docker compose up -d

echo ""
echo "Waiting for startup..."

sleep 10

echo ""
echo "Container status:"
docker ps | grep humanitz || true

echo ""
echo "Restore completed successfully."

echo ""
echo "Cleaning temporary files..."

rm -rf "${TMP_DIR}"

echo ""
echo "Done."
