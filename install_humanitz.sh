#!/bin/bash

set -e

mkdir -p config
mkdir -p saves
mkdir -p backups

cd docker

docker compose build --no-cache

docker compose up -d

echo ""
echo "HumanitZ server deployed."
