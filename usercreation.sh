#!/bin/bash

sudo apt update -y 
wget https://github.com/Shudhoo/Automated-Server-Health-Check-Script/raw/refs/heads/master/Users_setup.sh
sudo chmod 755 Users_setup.sh
sudo bash ./Users_setup.sh