#!/bin/bash

file=~/modul1/WA_Sales_Products_2012-14.csv

mapfile -t a < <(
    awk -F  "," '
        $7==2012 {
            arr[$1]+=$10
        }
        END {
            for(i in arr) print arr[i],i
        }' $file | sort -rn | awk '
                                NR==1 {
                                    print $2,$3
                                }')

mapfile -t b < <(
    awk -F  "," -v a_1="$a" '
        $1==a_1 {
            arr[$4]+=$10
        }
        END {
            for(i in arr) print arr[i],i
        }' $file | sort -rn | awk '
                                NR<=3 {
                                    print $2,$3
                                }')

mapfile -t c < <(
    awk -F  "," -v b_1="${b[0]}" -v b_2="${b[1]}" -v b_3="${b[2]}" '
        $4==b_1||$4==b_2||$4==b_3 {
            arr[$6]+=$10
        }
        END {
            for(i in arr) print arr[i],i
        }' $file | sort -rn | awk '
                                NR<=3 {
                                    print $2,$3,$4
                                }')

echo "a. Negara dengan penjualan(quantity) terbanyak pada tahun 2012"
echo "$a"

echo "b. Tiga product line yang memberikan penjualan(quantity) terbanyak pada negara di poin a"
for record in "${b[@]}"
do
    echo "$record"
done

echo "c. Tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line pada poin b"
for record in "${c[@]}"
do
   echo "$record"
done
