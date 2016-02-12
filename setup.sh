#!/bin/bash

srcs=`ls -1 ./markdown`
tmpfile="tmp.md"

for item in $srcs; do
	echo "Cat $item into temporary file"
	cat ./markdown/$item >> $tmpfile
	echo -e "\n" >> $tmpfile
done

pandoc $tmpfile -f markdown -t html -s -o index.html

rm $tmpfile
