#!/bin/bash

function basic_setup() {
mkd_dir="markdown"
css_dir="css"
srcs=`ls -1 $mkd_dir`
tmpfile="tmp.md"

for item in $srcs; do
	echo "Cat $item into temporary file"
	cat ./$mkd_dir/$item >> $tmpfile
	echo -e "\n" >> $tmpfile
done

pandoc $tmpfile -f markdown -t html -H $css_dir/template.css -s -o index.html

rm $tmpfile
}

basic_setup
