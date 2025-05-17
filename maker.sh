#!/bin/bash
echo ""
echo "team name : "
read tm
echo ""
echo "Do you have two files start and localstartall ? [y/n] "
read yORn
make
rm start localstartAll
rm -rf $tm/
mkdir $tm/
mkdir $tm/lib
cp /usr/local/StarerLibRCSC/lib/* $tm/lib -r
cp ./src/* $tm/ -r
cd $tm/
rm *.cpp *.h *.o
cd ../
if [ $yORn == "n" | $yORn == "N" ] ; then
    git clone https://github.com/SalehHamrahi/start-localstartAll.git 
    mv ./start-localstartAll/start ./$tm/
    mv ./start-localstartAll/localStartAll ./$tm/
    rm -rf ./start-localstartAll/
fi
cd ./$tm/
sed 's/std-base/'$tm'/g' ./start > ./q
rm -rf ./start
mv q start
cd ..
tar -zcvf $tm.tar.gz $tm/
rm -rf $tm/
mkdir ../binary/
mv $tm.tar.gz ../binary/
mv ./binary ../
