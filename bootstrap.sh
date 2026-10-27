#!/bin/bash

set -e

REPO_URL="https://github.com/fanktc/humanitz-server.git"
BRANCH="release/v1.0"
INSTALL_DIR="$HOME/humanitz-server"

echo ""
echo "===================================================="
echo " HumanitZ Dedicated Server Remote Bootstrap"
echo "===================================================="
echo ""

if ! command -v git >/dev/null 2>&1
then
    echo "Git not found. Installing..."

    sudo apt update
    sudo apt install -y git
fi

if [ ! -d "${INSTALL_DIR}" ]
then
    echo ""
    echo "Cloning repository..."

    git clone \
        --branch "${BRANCH}" \
        "${REPO_URL}" \
        "${INSTALL_DIR}"

else
    echo ""
    echo "Repository already exists."
fi

cd "${INSTALL_DIR}"

chmod +x bootstrap-local.sh
chmod +x scripts/*.sh

echo ""
echo "Launching local bootstrap..."
echo ""

exec ./bootstrap-local.sh
