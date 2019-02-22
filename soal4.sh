#!/bin/bash
et=$(date +'%R %d-%m-%Y')
hour=$(date +'%H')
returnenc=""

encode() {
	str=$1
	lettersL=( {a..z} )
	lettersC=( {A..Z} )
	#echo "${letters_array[*]}"

	for l in {0..25}; do
		tr_regex[$l]="A-Za-z "${lettersC[$l]}"-ZA-"${lettersC[$l-1]}""${lettersL[$l]}"-za-"${lettersL[$l-1]};
	done

	returnenc=`echo $str | tr ${tr_regex[$2]}`
}

#Start reading /var/log/syslog
FILE=/var/log/syslog
while read LINE; do
	#Rotate based on hour
	encode "$LINE" "$hour"
	#output to file
	echo "$returnenc" >> ./"$et".txt
done < $FILE

