#!/bin/bash

mkd_dir="markdown"
css_dir="css"
tmpfile="tmp.md"
metafile="metadata.yaml"
cssfile="t2.css"

function basicSetup() {
srcs=`ls -1 $mkd_dir`
for item in $srcs; do
	echo "Cat $item into temporary file"
	cat ./$mkd_dir/$item >> $tmpfile
	echo -e "\n\n" >> $tmpfile
done

generateHTML

rm $tmpfile
}

function generateHTML() {
echo "Producing HTML page"
pandoc $tmpfile $metafile -f markdown -t html --template templates/default.html -H $css_dir/$cssfile -s -o index.html
}

basicSetup
