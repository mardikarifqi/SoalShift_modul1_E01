# Soal 5

1. Saya membuat file bash `decrypt.sh` dengan kode sebagai berikut
   ```bash
    #!/bin/bash

    mkdir ~/modul1
    cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/' | awk 'NF<13' >> ~/modul1/logs

2. Konfigurasi untuk `crontab`
   ```bash
   2-30/6 * * * * ~/modul1/soal5.sh# Soal 5
