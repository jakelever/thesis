#!/bin/bash
set -eux

echo "Grabbing CancerMine and CIViCmine chapters"

cancermineDir=~/R/cancerminePaper/paper
civicmineDir=~/R/civicminePaper

cp $cancermineDir/paper.Rmd 04-cancermine.Rmd
cp $civicmineDir/paper.Rmd 05-civicmine.Rmd

cp $cancermineDir/bibliography.bibtex 04-cancermine.bib
cp $civicmineDir/civicmine.bibtex 05-civicmine.bib

rm -fr cancermine civicmine

cp -r $cancermineDir/cancermine .
cp -r $civicmineDir/civicmine .

for chap in "04-cancermine" "05-civicmine"
do
	cat $chap.header > $chap.tmp
	cat $chap.Rmd | tr '\n' '\0' | sed -e 's/---.*---//' | tr '\0' '\n' | sed -e 's/ {-}//g' >> $chap.tmp
	mv $chap.tmp $chap.Rmd
done
