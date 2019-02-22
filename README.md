# SoalShift_modul1_E01
Kelompok E1 Informatika ITS

## Soal 1

1. Lakukan `$unzip nature.zip` untuk mengekstrak arsip
    ![Extracting zip](https://github.com/mardikarifqi/SoalShift_modul1_E01/blob/master/img/1a.png?raw=true)
2. Saya membuat file bash `decrypt.sh` dengan kode sebagai berikut
   ```bash
    #!/bin/bash
    cd $1 
    for files in ./*.jpg 
    do
        echo "Decrypting $files"
        base64 -d "$files" | xxd -r > "$files"_aa.jpg
        rm "$files"
        mv "$files"_aa.jpg "$files"
    done
3. Untuk menjalankan file berikut, gunakan command ini
    `$ ./decrypt.sh /path-to-nature`
    ![](https://github.com/mardikarifqi/SoalShift_modul1_E01/blob/master/img/1b.png?raw=true)
4. Karena diminta untuk mendekripsi pada waktu tertentu, saya gunakan `crontab`
   ```bash
   14 14 14 2 * /mnt/e/sisop/decrypt
   14 14 * 2 FRI /mnt/e/sisop/decrypt

## Soal 2

## Soal 3

##### Pertama, saya membuat fungsi `genpass` yang digunakan untuk menciptakan password random
Fungsi ini mengambil data random dari `/dev/urandom` yang di pipe ke `tr` untuk di filter.

##### Membuat loop untuk memeriksa password yang sudah ada
`For..do` berfungsi untuk mendata semua password yang sudah ada di dalam file password.txt

##### Terakhir, generate dan echo passwordnya
Jika password yang di generate `genpass` sudah pernah didata, `while` akan men-generate password baru dan menulisnya di file dengan command `echo`

## Soal 4

## Soal 5

1. Saya membuat file bash `soal5.sh` dengan kode sebagai berikut
   ```bash
    #!/bin/bash

    mkdir ~/modul1
    cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/' | awk 'NF<13' >> ~/modul1/logs

2. Konfigurasi untuk `crontab`
   ```bash
   2-30/6 * * * * ~/modul1/soal5.sh# Soal 5
