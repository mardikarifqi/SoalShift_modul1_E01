#!/bin/bash

cat /var/log/syslog | awk 'IGNORECASE=1; /cron/ && !/sudo/' | awk 'NF<13' >> /home/pristiz/modul1/logs
