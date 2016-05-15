#!/bin/bash

mkd_dir="markdown"
css_dir="css"
tmpfile="tmp.md"

function basicSetup() {
srcs=`ls -1 $mkd_dir`
for item in $srcs; do
	echo "Cat $item into temporary file"
	cat ./$mkd_dir/$item >> $tmpfile
	echo -e "\n" >> $tmpfile
done

generateHTML

rm $tmpfile
}

function generateHTML() {
echo "Producing HTML page"
pandoc $tmpfile -f markdown -t html -H $css_dir/template.css -s -o index.html
}

basicSetup
