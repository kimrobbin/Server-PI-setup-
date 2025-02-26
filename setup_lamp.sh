#!/bin/bash

# Exit on error
set -e

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Apache2
echo "Installing Apache2..."
sudo apt install apache2 -y

# Enable and start Apache2 service
echo "Enabling and starting Apache2..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Install PHP and required extensions
echo "Installing PHP and extensions..."
sudo apt install php php-cli php-mysql php-curl php-gd php-mbstring php-xml php-zip libapache2-mod-php -y

# Restart Apache to apply PHP changes
echo "Restarting Apache..."
sudo systemctl restart apache2

# Install MariaDB Server
echo "Installing MariaDB..."
sudo apt install mariadb-server -y

# Enable and start MariaDB service
echo "Enabling and starting MariaDB..."
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Secure MariaDB installation
echo "Securing MariaDB..."
sudo mysql_secure_installation

# Allow HTTP and HTTPS through the firewall
echo "Configuring firewall..."
sudo ufw allow 'Apache Full'

# Check Apache and MariaDB status
echo "Checking service statuses..."
sudo systemctl status apache2 --no-pager
sudo systemctl status mariadb --no-pager

echo "LAMP stack installation complete!"
echo "You can now host PHP websites and use MariaDB for databases."
