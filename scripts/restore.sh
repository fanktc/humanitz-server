#!/bin/bash

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

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

echo ""
echo "===================================================="
echo " HumanitZ Restore"
echo "===================================================="
echo ""

echo "Stopping container..."

cd "${PROJECT_DIR}/docker"

docker compose down

echo ""
echo "Restoring files..."

cd "${PROJECT_DIR}"

tar -xzf "${BACKUP_FILE}"

echo ""
echo "Starting server..."

cd docker

docker compose up -d

echo ""
echo "Waiting for container startup..."

sleep 10

echo ""
echo "Container status:"
echo ""

docker ps | grep humanitz || true

echo ""
echo "Restore completed successfully."
echo ""
