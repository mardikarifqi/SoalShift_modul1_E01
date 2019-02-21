# Soal 3

##### Pertama, saya membuat fungsi `genpass` yang digunakan untuk menciptakan password random
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
