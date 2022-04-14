#!/bin/bash  
sudo yum update -y
sudo yum install httpd -y
sudo echo "<html><body><h1>Hello Baybees</h1></body></html>" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd