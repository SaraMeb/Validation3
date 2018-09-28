#!/bin/bash
cd /var/www/html
sudo apt update
sudo apt install apache2 -y
mkdir CSS JS
touch ./CSS/style.css
touch ./JS/script.js
sudo useradd -m Lina -p 1234
