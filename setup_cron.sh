#!/bin/bash

CRON_ENTRY="0 4 * * * $(pwd)/scripts/backup.sh"

(crontab -l 2>/dev/null | grep -v backup.sh; echo "$CRON_ENTRY") | crontab -

echo "Backup schedule configured."
