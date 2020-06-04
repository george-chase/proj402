#!/bin/bash
#
# Written by George Chase, June 2020 for SAIT Course Proj402
# This script installs Apache2 web server and MySQL database onto Ubuntu 14.04
# then sets the root password for MySQL and makes the MySQL server listen on all
# server IP addresses so that it can be accessed remotely (dangerous).
#
# NOTE : This script was specifically written to run on Ubuntu 14.04 and will likely not run
# without modification on newer versions of Ubuntu.
#
#
# Check to see if we are running as root, if not, exit doing nothing
if [[ $EUID -ne 0 ]]; then
   echo "****************"
   echo "Capstone Lathe-Server install - This script must be run as root" 
   exit 1
fi
# Get an updated list of software on repository
apt update
# Install Apache2 web server
apt-get -y install apache2
# Set the MySQL root password to "latheserver" and confirm it
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password latheserver'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password latheserver'
# Now install mysql-server version 5.5
apt-get -y install  mysql-server-5.5
# Set mysql server to listen on ALL ip addresses instead of just 127.0.0.1
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
# Restart the mysql server
service mysql restart

