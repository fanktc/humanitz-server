#!/bin/bash

DATA=$(date +%Y%m%d_%H%M)

ARQUIVO=~/backups/humanitz/humanitz_${DATA}.tar.gz

tar -czf \
${ARQUIVO} \
~/humanitz-docker/config \
~/humanitz-docker/saves

rclone copy \
${ARQUIVO} \
onedrive:/HumanitZBackups
