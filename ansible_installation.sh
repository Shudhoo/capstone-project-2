#!/bin/bash

sudo apt update -y 
sleep 10
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installAnsible.sh -P /tmp
sudo chmod 755 /tmp/installAnsible.sh
sudo bash /tmp/installAnsible.sh