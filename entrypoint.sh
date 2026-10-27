#!/bin/bash
set -e

mkdir -p /serverfiles
mkdir -p /config
mkdir -p /saves

/usr/games/steamcmd \
    +force_install_dir /serverfiles \
    +login anonymous \
    +app_update 2728330 -beta linuxbranch validate \
    +quit

if [ ! -f /config/GameServerSettings.ini ]; then
    cp /serverfiles/HumanitZServer/REF_GameServerSettings.ini \
       /config/GameServerSettings.ini
fi

cp /config/GameServerSettings.ini \
   /serverfiles/HumanitZServer/GameServerSettings.ini

chmod +x /serverfiles/HumanitZServer.sh

chown -R 1000:1000 /serverfiles
chown -R 1000:1000 /config
chown -R 1000:1000 /saves

exec su ubuntu -s /bin/bash -c "
cd /serverfiles
./HumanitZServer.sh
"
