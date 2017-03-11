#!/bin/bash
FILES=./*.png
for f in $FILES
do
	echo "Processing - $f ..."
	./extract_features.ln -harhes -i "$f" -sift -pca harhessift.basis
done
