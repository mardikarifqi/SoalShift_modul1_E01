#!/bin/bash

mkdir ~/modul1
cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/' | awk 'NF<13' >> ~/modul1/logs
