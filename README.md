# HumanitZ Dedicated Server

## Features

- Docker-based deployment
- SteamCMD automatic update
- HumanitZ Linux Branch support
- Persistent saves
- Persistent configuration
- Automated backups
- OneDrive backup integration
- Git versioned infrastructure

---

## Ports

| Port | Protocol | Purpose |
|--------|----------|----------|
| 7777 | UDP | Game traffic |
| 27015 | UDP | Query traffic |

---

## First Installation

```bash
git clone <repository_url>

cd humanitz-server

chmod +x scripts/*.sh

./scripts/install_docker.sh
`*`

Logout and reconnect.

```bash
*/scripts/install_rclone.sh
```

Co*figure OneDrive.

```bash*./scripts/install_humanitz.sh
```
*Enable daily*backups.

```bash
./scripts/setup_*ron.sh
```

---

## Daily Operatio*s

*tart:

```bash
cd docker

*ocker compose up -d
```

Stop:

*``bash
cd docker

docker compose d*wn*```

Logs:

```bash
docker logs*-f humanitz
```

---

*# Backup

```bash
./scripts/backup*sh
```

---

## Restore

```bash*./scripts/restore.sh backup*tar.gz
```

---

## Update*
```bash
./scripts/update_server.s*
*``

---

## Health Check

```bash
*/scripts/healthcheck.sh
```
*
