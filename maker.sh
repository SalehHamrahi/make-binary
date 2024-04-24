#!/bin/bash
make
rm -rf $1/
mkdir $1/
mkdir $1/lib
cp /usr/local/StarerLibRCSC/lib/* $1/lib -r
cp /src/* $1/ -r
cd $1/
rm *.cpp *.h
cd ../
tar -zcvf $1.tar.gz $1/
rm -rf $1/
mkdir binary/
mv $1.tar.gz ./binary/
mv ./binary ../
