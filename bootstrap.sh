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
    echo "Run the command below after bootstrap finishes:"
    echo ""
    echo "    rclone config"
    echo ""
    echo "When asked:"
    echo ""
    echo "    Use auto config?"
    echo ""
    echo "Select:"
    echo ""
    echo "    n"
    echo ""
    echo "Rclone will display a login URL."
    echo ""
    echo "Open it from your local computer."
    echo "Authenticate normally."
 
