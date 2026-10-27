# HumanitZ Dedicated Server

Automated HumanitZ dedicated server deployment for Ubuntu using Docker, SteamCMD and OneDrive backups.

## Features

- Docker-based deployment
- Automatic HumanitZ installation
- Linux server branch support
- Persistent game saves
- Persistent configuration
- Local backups
- OneDrive backup integration
- Git versioned infrastructure
- Easy migration to new servers

## Installation

### Option 1 - Bootstrap Installation (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/humanitz-server/main/bootstrap.sh | bash
```

### Option 2 - Git Clone (SSH)

```bash
git clone git@github.com:YOUR_USERNAME/humanitz-server.git
cd humanitz-server
chmod +x bootstrap.sh
chmod +x scripts/*.sh
./bootstrap.sh
```

### Option 3 - Git Clone (HTTPS)

```bash
git clone https://github.com/YOUR_USERNAME/humanitz-server.git
cd humanitz-server
chmod +x bootstrap.sh
chmod +x scripts/*.sh
./bootstrap.sh
```

### Option 4 - Download ZIP

```bash
wget https://github.com/YOUR_USERNAME/humanitz-server/archive/refs/heads/main.zip
unzip main.zip
cd humanitz-server-main
chmod +x bootstrap.sh
chmod +x scripts/*.sh
./bootstrap.sh
```

## OneDrive Headless Authentication

Run:

```bash
rclone config
```

Choose manual authentication and open the generated URL on another computer with a browser.

## Daily Operations

Start:

```bash
cd docker && docker compose up -d
```

Stop:

```bash
cd docker && docker compose down
```

Logs:

```bash
docker logs -f humanitz
```
