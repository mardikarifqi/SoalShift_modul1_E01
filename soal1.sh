#!/bin/bash
cd $1
for files in ./*.jpg
do
   echo "Decrypting $files"
   base64 -d "$files" | xxd -r > "$files"_aa.jpg
   rm "$files"
   mv "$files"_aa.jpg "$files"
done
