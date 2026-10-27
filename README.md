# HumanitZ Dedicated Server

Dockerized server for HumanitZ Linux.

## Components

- Docker
- Docker Compose
- SteamCMD
- Auto Update
- Local Backup
- OneDrive Backup

## Ports

7777/UDP
27015/UDP

## Start

docker compose up -d

## Stop

docker compose down

## Logs

docker logs -f humanitz

## Backup

./scripts/backup.sh

## Update

./scripts/update.sh

## Structure

config/
saves/
backups/
serverfiles/

## Restore

./scripts/restore.sh
