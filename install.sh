#!/bin/bash

# Keeps your OS up to date 
sudo apt update 
sudo apt upgrade -y

# Allows remote connection and enables firewall for SSH
sudo apt install -y openssh-server  
sudo ufw enable
sudo ufw allow ssh

# Installs Python, Git, MariaDB, and Neovim
sudo apt install -y python3-pip git mariadb-server neovim

# Secure MySQL installation
sudo mysql_secure_installation
