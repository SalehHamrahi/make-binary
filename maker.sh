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
start_file='#!/bin/sh
HOST=$1
BASEDIR=$2
NUM=$3

LIBPATH='./lib/'
if [ x"$LIBPATH" != x ]; then
  if [ x"$LD_LIBRARY_PATH" = x ]; then
    LD_LIBRARY_PATH=$LIBPATH
  else
    LD_LIBRARY_PATH=$LIBPATH:$LD_LIBRARY_PATH
  fi
  export LD_LIBRARY_PATH
fi


teamname="std-base"

player="./sample_player"
coach="./sample_coach"

config="./player.conf"
coach_config="./coach.conf"

opt="--player-config ${config}"
opt="${opt} -h ${HOST} -t ${teamname}"

coachopt="--coach-config ${coach_config} --use_team_graphic on"
coachopt="${coachopt} -h ${HOST} -t ${teamname}"

cd $BASEDIR

case $NUM in
    1)
        $player $opt -g
        ;;
    12)
        $coach $coachopt
        ;;
    *)
        $player $opt
        ;;
esac'

startAll_file='#!/bin/sh
./start 127.0.0.1 . 1 &
sleep 2
./start 127.0.0.1 . 2  &
sleep 0.3
./start 127.0.0.1 . 3  &
sleep 0.3
./start 127.0.0.1 . 4  &
sleep 0.3
./start 127.0.0.1 . 5  &
sleep 0.3
./start 127.0.0.1 . 6  &
sleep 0.3
./start 127.0.0.1 . 7  &
sleep 0.3
./start 127.0.0.1 . 8  &
sleep 0.3
./start 127.0.0.1 . 9  &
sleep 0.3
./start 127.0.0.1 . 10 &
sleep 0.3
./start 127.0.0.1 . 11 &
sleep 0.3
./start 127.0.0.1 . 12 &'

echo -e "$Signature"
make 2> a > o

if [ -s a ]; then
    echo "Failed to build."
else
    echo "team name : "
    read tm
    echo ""
    echo "Please wait a few seconds ..."
    echo ""

    rm src/start src/localstartAll &> o
    rm -rf $tm/
    mkdir $tm/
    mkdir $tm/lib
    cp /usr/local/StarerLibRCSC/lib/* $tm/lib -r &> o
    cp ./src/* $tm/ -r
    cd $tm/
    rm *.cpp *.h *.o
    cd ../

    echo -e "$start_file" > start
    echo -e "$startAll_file" > localStartAll
    chmod +x start localStartAll
    mv ./start ./$tm/
    mv ./localStartAll ./$tm/

    cd ./$tm/
    sed -i -r 's/std-base/'$tm'/g' start
    cd ..
    tar -zcf $tm.tar.gz $tm/
    rm -rf $tm/
    mkdir ../binary/ &> o
    mv $tm.tar.gz ../binary/
    sleep 1
    echo "Binary build completed successfully."
fi
rm o a