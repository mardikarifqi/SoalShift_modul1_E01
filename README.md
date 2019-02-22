# SoalShift_modul1_E01
Kelompok E1 Informatika ITS

## Soal 1

1. Lakukan `$unzip nature.zip` untuk mengekstrak arsip
    ![Extracting zip](https://github.com/mardikarifqi/SoalShift_modul1_E01/blob/master/img/1a.png?raw=true)
2. Membuat file bash `decrypt.sh` dengan kode sebagai berikut
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
3. Untuk menjalankan file tersebut, gunakan command ini
    `$ ./decrypt.sh /path-to-nature`
    ![](https://github.com/mardikarifqi/SoalShift_modul1_E01/blob/master/img/1b.png?raw=true)
4. Karena diminta untuk mendekripsi pada waktu tertentu, gunakan `crontab`
   ```bash
   14 14 14 2 * /bin/bash /mnt/e/sisop/decrypt.sh
   14 14 * 2 FRI /bin/bash /mnt/e/sisop/decrypt.sh

## Soal 2


- `file=~/modul1/WA_Sales_Products_2012-14.csv` untuk menyimpan _path_ ke file pada variabel `$file`.
- `mapfile -t [nama variabel]` untuk menyimpan hasil pada _array_.
- `awk -F ","` untuk mengubah _field separator_ menjadi tanda koma (secara _default_ spasi).

#### a. Negara dengan penjualan(quantity) terbanyak pada tahun 2012
- `$7==2012` untuk mencocokkan kolom 7 dengan string 2012.
- `arr[$1]+=$10` untuk menjumlahkan nilai-nilai pada kolom 10 berdasarkan nilai pada kolom 1.
- `sort -rn` untuk mengurutkan secara descending hasil yang didapatkan.
- `NR==1` untuk menampilkan hasil pada row ke-1 saja.

#### b. Tiga product line yang memberikan penjualan(quantity) terbanyak pada negara di poin a
- `awk -v a_1="$a"`untuk mengubah isi dari $a menjadi variabel pada awk.
- `$1==a_1` untuk mencocokkan kolom 1 dengan hasil dari poin a.
- `arr[$4]+=$10` untuk menjumlahkan nilai-nilai pada kolom 10 berdasarkan nilai pada kolom 4.
- `sort -rn` untuk mengurutkan secara descending hasil yang didapatkan.
- `NR<=3` untuk menampilkan hasil pada row ke-1,2,3.

#### c. Tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line pada poin b
- `awk -v b_1="${b[0]}" -v b_2="${b[1]}" -v b_3="${b[2]}"`untuk mengubah nilai-nilai dari array $b menjadi variabel pada awk.
- `$4==b_1||$4==b_2||$4==b_3` untuk mencocokkan kolom 4 dengan hasil-hasil dari poin b.
- `arr[$6]+=$10` untuk menjumlahkan nilai-nilai pada kolom 10 berdasarkan nilai pada kolom 6.
- `sort -rn` untuk mengurutkan secara descending hasil yang didapatkan.
- `NR<=3` untuk menampilkan hasil pada row ke-1,2,3.


## Soal 3

##### Membuat fungsi `genpass` yang digunakan untuk menciptakan password random
Fungsi ini mengambil data random dari `/dev/urandom` yang di pipe ke `tr` untuk di filter.

##### Membuat loop untuk memeriksa password yang sudah ada
`For..do` berfungsi untuk mendata semua password yang sudah ada di dalam file password.txt

##### Terakhir, generate dan echo passwordnya
Jika password yang di generate `genpass` sudah pernah didata, `while` akan men-generate password baru dan menulisnya di file dengan command `echo`

    ```bash
    #!/bin/bash
	arr=()
	num=1
	keepadd=1
	pass=""
	passf=0

	#Randomizing password 12 char a-ZA-Z0-9
	function genpass () {
		pass=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12`
	}

	#Check element in array
	function ce () {
		passf=0
		for e in ${arr[@]}
		do
			if [ "$pass" -eq "$e" ]
			then
				passf=1
				break
			fi
		done
	}

	#Checking password to array
	for files in ./password_*.txt; do
		array+=(`cat $files`)
		if [ $keepadd -eq 1 ]
		then
			if [ "$files" != "./password_$num.txt" ]
			then
				keepadd=0
				break
			fi
		fi
		num=$((num + 1))
	done

	while [ 1 -eq 1 ]; do
		genpass
		ce
		if [ $passf == 0 ]
		then
			break
		fi
	done

    echo $pass > "./password_$num.txt"

## Soal 4

## Soal 5

1. Membuat folder `modul1`
    ```bash
    mkdir ~/modul1

2. Membuat file bash `soal5.sh` dengan kode sebagai berikut
   ```bash
    #!/bin/bash

    cat /var/log/syslog | awk 'IGNORECASE=1; /cron/ && !/sudo/' | awk 'NF<13' >> /home/pristiz/modul1/logs
  
- _Command_ `cat /var/log/syslog` untuk mengoutputkan isi file `syslog`.
  
- Output dari _command_ tersebut kemudian di-_pipe_ ke perintah selanjutnya, yaitu`awk 'IGNORECASE=1; /cron/ && !/sudo/'`. _Syntax_ `IGNORECASE=1` berfungsi untuk mengabaikan besar-kecil huruf. _Regex_ `/cron/ && !/sudo/` mencocokkan hasil yang mengandung string _cron_, namun tidak mengandung string _sudo_.
  
- Terakhir, hasil dari _command_ sebelumnya dioutputkan yang memiliki kolom kurang dari 13 dan di-_append_ pada file logs.

3. Karena diminta untuk menjalankan perintah pada waktu tertentu, gunakan `crontab`
   ```bash
   2-30/6 * * * * /bin/bash ~/modul1/soal5.sh
