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


# Allow HTTP and HTTPS through the firewall
echo "Configuring firewall..."
sudo ufw allow 'Apache Full'

# Check Apache and MariaDB status
echo "Checking service statuses..."
sudo systemctl status apache2 --no-pager
sudo systemctl status mariadb --no-pager


