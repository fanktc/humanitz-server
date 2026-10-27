if command -v rclone >/dev/null 2>&1
then
    echo "Rclone already installed."
    exit 0
fi

#!/bin/bash

set -e

echo "Installing Rclone..."

curl https://rclone.org/install.sh | sudo bash

echo ""
echo "================================================="
echo "OneDrive Setup"
echo "================================================="
echo ""
echo "Run:"
echo ""
echo "    rclone config"
echo ""
echo "Select:"
echo ""
echo "n    -> New remote"
echo "onedrive"
echo "onedrive"
echo ""
echo "When asked to open browser:"
echo ""
echo "Select: n"
echo ""
echo "Copy the generated URL"
echo "Open it on your local computer"
echo "Authenticate"
echo "Paste the generated token back here"
echo ""
echo "Test with:"
echo ""
echo "rclone lsd onedrive:"
echo ""
