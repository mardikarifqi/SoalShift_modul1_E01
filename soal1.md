# Soal 1

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
