# Tutorial for how to download and set up your rasbarry pi / ubuntu

* Download the raspberry pi imager here: https://www.raspberrypi.com/software/
    * Once the imager is downloaded, run the .exe file and choose your raspberry pi model, Ubuntu OS, and the storage location, which in our case is the SD card.
    
    For normal machines click here to install ubuntu: https://ubuntu.com/download/desktop 

    * If you want to install normal Ubuntu you need Rufus to make the file useable

* Once you have your OS on the USB stick / SD card, plug it into your pc / pi 

    * Choose the desktop option and just follow the installation guide

* When your installation is finished run these commands in bash
    * CTRL + ALT + T to open bash command line
```sh 
# Keeps your OS up to date 
sudo apt update 
sudo apt upgrade

# allows remote connection and allows you to connect through firewall
sudo apt install openssh-server  
sudo ufw enable
sudo ufw allow ssh

# Installs python, git and mariadb, neovim 
sudo apt install python3-pip git mariadb-server neovim

# Install mysql. Press enter when it first launches.  After there will be multiple prompts, Y =  yes and N = no,  Correct: n, n, Y, Y, Y, Y, Y 
sudo mysql_secure_installation    
```

# SSH KEY 

Makes you able to log into you pc without password

```sh
# On your main computer. Just press enter on all 
ssh-keygen  

# Find the path for your ssh key
C:\Users\kleva\.ssh\id_rsa.pub   # This is an example on how the path looks like. 

# After finding your path go in to terminal again and write "scp path pc_name@IP:"
scp C:\Users\kleva\.ssh\id_rsa.pub pc_name@IP:

# Moving the key to authorized keys so you can go log in without password 
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys

```
# Setup for static ip

```sh
# To open the ip UI
nmtui

# Move into edit connection and choose either wifi or lan.
# Now go into Ipv4 and change the adress and remember to change from automatic to manual
```



# Setup Mariadb 
To log in to mariadb use this command ``sudo mariadb -u root``

```sql 
-- Makes a MariaDB user. Change "username" to your desierd name. Change "password" to your desired password
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

-- Gives your user all the privileges. Use the same password 
GRANT ALL PRIVILEGES ON *.* TO 'username'@’localhost’ IDENTIFIED BY 'password';


-- Gives your accout the privleges 
FLUSH PRIVILEGES;

```

# Getting files on another Computer
```sh
# Use scp path and pc_name@ip
scp C:\Users\kleva\Downloads\telefonkatalog_med_database.py kim@10.2.4.62: # This is an example of a scp command 
 
```

## How to download "Telefonkatalog" and how to use it 

```sh
# First download it from my repo
git clone https://github.com/kimrobbin/Server-PI-setup- # You get my whole tutorial and the file 
# Then run this command to transfer the file (You need to change the path and ip to your own, this is just my path, pc_name and ip)
scp C:\Users\kleva\Downloads\telefonkatalog_med_database.py kim@10.2.4.62:

# Now ssh/log onto your ubuntu computer and move the file into a folder and the place you want 
mkdir Telefon # This makes a folder named Telefon

mv telefonkatalog_med_database.py Telefon # This moves the program into a folder.

# Use the mv command again to move the folder to your desired place 

# To run the file go into the folder ( use cd to navigate) and write 
python3 telefonkatalog_med_database.py

```