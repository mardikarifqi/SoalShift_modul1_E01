#!/bin/bash

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

#Start reading encrypted file
bn=`basename $1`
hour=`cut -d":" -f1 <<< $bn`
hour=$(( 26 - $hour ))
FILE=$1
while read LINE; do
	#Rotate based on hour
	encode "$LINE" "$hour"
	echo "$returnenc"
done < "$FILE"

