#!/bin/bash
set -eux

echo "Grabbing CancerMine chapter"

cancermineDir=~/R/cancerminePaper/paper

cp $cancermineDir/paper.Rmd 04-cancermine.Rmd

cp $cancermineDir/bibliography.bibtex 04-cancermine.bib

rm -fr cancermine

cp -r $cancermineDir/cancermine .

for chap in "04-cancermine"
do
	cat $chap.header > $chap.tmp
	cat $chap.Rmd | tr '\n' '\0' | sed -e 's/---.*---//' | tr '\0' '\n' | sed -e 's/ {-}//g' >> $chap.tmp
	mv $chap.tmp $chap.Rmd
done
