#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "===================================================="
echo " HumanitZ Dedicated Server Bootstrap"
echo "===================================================="
echo ""

echo "[1/7] Creating project directories..."

mkdir -p "${PROJECT_ROOT}/config"
mkdir -p "${PROJECT_ROOT}/saves"
mkdir -p "${PROJECT_ROOT}/backups"

echo "Done."
echo ""

echo "[2/7] Installing Docker..."

"${PROJECT_ROOT}/scripts/install_docker.sh"

echo ""
echo "[3/7] Installing Rclone..."

"${PROJECT_ROOT}/scripts/install_rclone.sh"

echo ""
echo "[4/7] Configuring automated backups..."

"${PROJECT_ROOT}/scripts/setup_cron.sh"

echo ""
echo "[5/7] OneDrive Backup Setup"
echo ""

read -p "Would you like to configure OneDrive now? [y/N] " ANSWER

if [[ "$ANSWER" =~ ^[Yy]$ ]]
then

    echo ""
    echo "===================================================="
    echo " OneDrive Headless Authentication"
    echo "===================================================="
    echo ""
    echo "Run:"
    echo ""
    echo "    rclone config"
    echo ""
    echo "Choose:"
    echo ""
    echo "    n"
    echo ""
    echo "for auto config."
    echo ""
    echo "Open the generated URL on your local computer."
    echo "Authenticate with Microsoft."
    echo "Paste the generated token back into the server."
    echo ""
fi

echo ""
echo "[6/7] Deploying HumanitZ..."

"${PROJECT_ROOT}/scripts/install_humanitz.sh"

echo ""
echo "[7/7] Running health check..."

"${PROJECT_ROOT}/scripts/healthcheck.sh"

echo ""
echo "===================================================="
echo " Deployment Completed Successfully"
echo "===================================================="
echo ""

echo "Useful commands:"
echo ""

echo "Logs:"
echo "docker logs -f humanitz"

echo ""
echo "Backup:"
echo "./scripts/backup.sh"

echo ""
echo "Update:"
echo "./scripts/update_server.sh"

echo ""
echo "Health Check:"
echo "./scripts/healthcheck.sh"

echo ""
