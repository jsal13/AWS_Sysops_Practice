#!/bin/bash  
yum update -y
yum install httpd -y
echo "<html><body><h1>Hello Baybees</h1></body></html>" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd