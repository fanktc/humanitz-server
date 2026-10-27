# HumanitZ Dedicated Server

## Features

- Docker-based deployment
- SteamCMD automatic updates
- HumanitZ Linux Branch support
- Persistent saves
- Persistent configuration
- Automated backups
- OneDrive backup integration
- Git versioned infrastructure
- Fully reproducible deployment

---

## Ports

| Port | Protocol | Purpose |
|--------|----------|----------|
| 7777 | UDP | Game traffic |
| 27015 | UDP | Query traffic |

---

# Installation Options

## Option A - Git Clone (Recommended)

```bash
git clone git@github.com:<YOUR_USER>/humanitz-server.git

cd humanitz-server

chmod +x scripts/*.sh

./scripts/install_docker.sh
*``

Reconnect to the server after *ocker installation.

```bash
./scr*pts/install_rclone.sh*
rclone config

./scripts/install_*umanitz.sh

./scripts*setup_cron.sh
```

---

## Option * - Git*Clone via HTTPS

```bash
git clone*https://github.com/<YOUR_USER>/hum*nitz-server.git

cd humanitz-server

chmod +x scripts/*.sh

./scripts/install_docker.sh
```

Reconnect to the server.

```bash
./scripts/install_rclone.sh

rclone config

./scripts/install_humanitz.sh

./scripts/setup_cron.sh
```

---

## Option C - Download ZIP

```bash
wget https://github.com/<YOUR_USER>/humanitz-server/archive/refs/heads/main.zip

unzip main.zip

cd humanitz-server-main

chmod +x scripts/*.sh

./scripts/install_docker.sh
*``

Reconnect to the server.

```b*sh
./scripts/install_rclone.sh*
rclone config

./scripts/install_*umanitz.sh

./scripts/setup_cron.s*
```

---

## Option D - One-Line *nstallation (curl)

This*option is useful when provisioning*a fresh VM.

```bash
curl -fs*L https://raw.githubusercontent.co*/<YOUR_USER>/humanitz-server/main*bootstrap.sh | bash
```

The*bootstrap script will:

- Install *it (*f missing)
- Clone the repository
* Make scripts executable
- Run Doc*er installation
- Print next steps*
After reconnect*ng:

```bash
cd humanitz-server

.*scripts/install_rclone.sh

rclone *onfig

./scripts/install_humanitz*sh

./scripts/setup_cron.sh
```

-*-

# OneDrive Configuration

This *roject is designed for headless Li*ux servers.

When running:

```bas*
rclone config
*``

Choose:

```text
n
``*

for a new remote.

Remote name:
*```text
*nedrive
```

Storage type:

```tex*
*nedrive
```

When asked:

```text
*se auto*config?
```

Choose:

```*ext
n
```

Rclone will generate a *RL similar to:

```text
https://lo*in.microsoftonline.com/...
```

St*ps*

1. Copy the URL.
2. Open it on*your local workstation.
3. Sign*in with your Microsoft account.
4.*Approve OneDrive access.
5. Copy t*e generated verification code.
*. Paste the code back into the ser*er terminal.

*est access:

```bash
rclone lsd on*drive:
```

If successful, backups*will automatically upload*to:

```text
OneDrive/HumanitZBack*ps
```

---

# First Deployment

`*`bash
./scripts/install_human*tz.sh
```

Enable automatic backup*:

```bash*./scripts/setup_cron.sh
```

*--

# Daily Operations

## Start S*rver

```bash
cd docker

docker co*pose up -d
```

## Stop Server

``**ash
cd docker

docker compose down*```

## Restart Server

```bash
cd*docker

docker compose restart
```*
##*View Logs

```bash
docker logs -f *umanitz
```

## Container Status

*``bash
docker ps
```

---

# Backu*

Manual backup:

```bash
./script*/backup.sh*```

Automatic backup:

```text
Da*ly at 04:00
```

Uploaded automati*ally to:

*``text
OneDrive/HumanitZBackups
``*

---

* Restore

```bash
./scripts/restor*.sh <backup_file.tar.gz>
```

Exam*le:

```bash
./scripts/restore.sh*humanitz_20261024_0400.tar.gz
```
*---

# Update Server

```bash
./sc*ipts/update_server*sh
```

---

# Health Check

```ba*h
./scripts/*ealthcheck.sh
```

---

# Migratio* to a New Server

Install a*fresh Ubuntu VM.

Run:

```bash
gi**clone git@github.com:<YOUR_USER>/h*manitz-server.git

cd humanitz-ser*er

chmod +x scripts/*.sh

*/scripts/install_docker.sh
```

Re*onnect.

Configure*OneDrive:

```bash
./scripts/insta*l_rclone.sh

*clone config
```

Restore your lat*st backup.

Start the server:

```*ash
./scripts/install_humanitz.sh
*``

The server will be fully opera*ional using the restored saves and*configuration.
