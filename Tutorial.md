# Tutorial for how to download and set up your rasbarry pi / ubuntu

* Donwload your instalation media. For rasberry pi klick here: https://www.raspberrypi.com/software/
    * Chosse your OS (Ubuntu), then  wire it on the disk

    For normal ubuntu click here: https://ubuntu.com/download/desktop 
    * If you want to insall normal ubuntu you need Rufus to make the file useable

* Once you have your OS on the USB stick / SD card, plug it into your pc / pi 

    * Choose the graphical desktop option and just follow the instalation guide

* Wen your installation is finished run these commands in bash
```sh 
# Keeps you OS up to date 
sudo apt update 
sudo apt upgrade

# allows remote connection and allows you to connect through firewall
sudo apt install openssh-server  
sudo ufw enable
sudo ufw allow ssh

# Installs python, git and mariadb, neovim 
sudo apt install python3-pip git mariadb-server neovim

# Install mysql. Press enter when it first launches. After there will be multiple prompts, Y =  yes and N = no,  Correct: n, n, Y, Y, Y, Y, Y 
sudo mysql_secure_installation    
```

# SSH KEY 

Makes you able to log into you pc without password

```sh
# On your main computer. Bare å trykke enter på alt
ssh-keygen  

# Find the path for you ssh key
C:\Users\kleva\.ssh\id_rsa.pub   # This is a exempel on how the path looks like. 

# After finding your path go in to terminal again and write "scp path pc_name@IP:"
scp C:\Users\kleva\.ssh\id_rsa.pub pcNavn@IP:



```




# Setup Mariadb 
To log in to mariadb use this command ``sudo mariadb -u root``

```sql 
-- Makes a MariaDB user. Change "username" to your desierd name. Change "password" to your desired password
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

-- Gives your user admin. Use the same password 
GRANT ALL PRIVILEGES ON *.* TO 'username'@’localhost’ IDENTIFIED BY 'password';


-- Gives your accout the privliges 
FLUSH PRIVILEGES;

```