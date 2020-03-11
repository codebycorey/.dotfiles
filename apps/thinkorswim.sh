#!/usr/bin/env bash

echo "Installing Zulu OpenJDK..."

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
sudo apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
sudo apt-get update
sudo apt-get install zulu-8 default-jre

sudo update-alternatives --config java
sudo update-alternatives --config javac

wget https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh
chmod +x ./thinkorswim_installer.sh

./thinkorswim_installer.sh

rm ./thinkorswim_installer.sh

sudo ln -s ~/thinkorswim/thinkorswim /usr/local/bin/
