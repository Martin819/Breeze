#!/bin/bash

echo "CHECKING openthread DIRECTORY"
if [ -d ./openthread ] ; then
  echo "openthread directory is present"
  cd openthread
  git checkout master
  git reset origin master --hard
  git pull
  cd ..
else
  echo "CLONING openthread DIRECTORY"
  git clone --recursive https://github.com/openthread/openthread.git
fi
echo "CHECKING wpantund DIRECTORY"
if [ -d ./wpantund ] ; then
  echo "wpantund directory is present"
  cd wpantund
  git checkout master
  git reset origin master --hard
  git pull
  cd ..
else
  echo "CLONING wpantund DIRECTORY"
  git clone --recursive https://github.com/openthread/wpantund.git
fi
echo "INSTALLING dependencies"
sudo apt-get install dbus libreadline
sudo apt-get install gcc g++ libdbus-1-dev libboost-dev libreadline-dev
sudo apt-get install libtool autoconf autoconf-archive
echo "INSTALLING OPENTHREAD"
cd openthread
./script/bootstrap
./bootstrap
cd ..
echo "DONE INSTALLING OPENTHREAD"
echo "INSTALLING WPANTUND"
cd wpantund
./script/bootstrap
./bootstrap.sh
./configure
make
sudo make install
echo "DONE INSTALLING WPANTUND"
echo "Rebooting required. Rebooting in 10 seconds."
sleep 10
reboot