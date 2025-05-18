#!/bin/bash
Signature='
 /$$$$$$$                        /$$           /$$      /$$           /$$                          
| $$__  $$                      | $$          | $$$    /$$$          | $$                          
| $$  \ $$ /$$   /$$  /$$$$$$$ /$$$$$$        | $$$$  /$$$$  /$$$$$$ | $$   /$$  /$$$$$$   /$$$$$$ 
| $$  | $$| $$  | $$ /$$_____/|_  $$_/        | $$ $$/$$ $$ |____  $$| $$  /$$/ /$$__  $$ /$$__  $$
| $$  | $$| $$  | $$|  $$$$$$   | $$          | $$  $$$| $$  /$$$$$$$| $$$$$$/ | $$$$$$$$| $$  \__/
| $$  | $$| $$  | $$ \____  $$  | $$ /$$      | $$\  $ | $$ /$$__  $$| $$_  $$ | $$_____/| $$      
| $$$$$$$/|  $$$$$$/ /$$$$$$$/  |  $$$$/      | $$ \/  | $$|  $$$$$$$| $$ \  $$|  $$$$$$$| $$      
|_______/  \______/ |_______/    \___/        |__/     |__/ \_______/|__/  \__/ \_______/|__/      

---------------------------------------------------------------------------------------------------
                                         ***Dust_Maker***
---------------------------------------------------------------------------------------------------
by :
    saleh hamrahi
    sadra hamrahi
---------------------------------------------------------------------------------------------------
'
echo -e "$Signature"
echo "team name : "
read tm
echo ""
echo "Please wait a few seconds ..."
echo ""
make &> a
rm src/start src/localstartAll &> a
rm -rf $tm/
mkdir $tm/
mkdir $tm/lib
cp /usr/local/StarerLibRCSC/lib/* $tm/lib -r &> a
cp ./src/* $tm/ -r
cd $tm/
rm *.cpp *.h *.o
cd ../

git clone https://github.com/SalehHamrahi/start-localstartAll.git &> a
mv ./start-localstartAll/start ./$tm/
mv ./start-localstartAll/localStartAll ./$tm/
rm -rf ./start-localstartAll/

cd ./$tm/
sed -i -r 's/std-base/'$tm'/g' start
cd ..
tar -zcf $tm.tar.gz $tm/
rm -rf $tm/
rm a
mkdir ../binary/ &> a
rm a
mv $tm.tar.gz ../binary/
sleep 1
echo "Binary build completed successfully."