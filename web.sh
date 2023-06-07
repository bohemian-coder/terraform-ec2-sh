#!/bin/bash

#install prereq tools
yum install wget unzip httpd -y

#start apache server
systemctl start httpd
systemctl enable httpd

#get HTML template
wget https://www.free-css.com/assets/files/free-css-templates/download/page291/nano-folio.zip
unzip -o nano-folio.zip
cp -r 2122_nano_folio/* /var/www/html

systemctl restart httpd