#!/bin/bash

(crontab -l 2>/dev/null; echo "0 4 * * * $(pwd)/scripts/backup.sh") | crontab -
