#!/bin/bash
mkdir data
touch Vagrantfile

echo "# -*- mode: ruby -*-" >> ./Vagrantfile
echo "# vi: set ft=ruby :" >> ./Vagrantfile

echo "Vagrant.configure('2') do |config|" >> ./Vagrantfile
echo "config.vm.box = 'ubuntu/xenial64'" >> ./Vagrantfile

echo "quel ip souhaiter vous ajouter a votre serveur?"
read ipAdress
echo "config.vm.network 'private_network', ip: '$ipAdress'" >> ./Vagrantfile
echo "Avec quel dossier souhaiter vous le synchroniser ?"
read directory
echo "config.vm.synced_folder './$directory', '/var/www/html'" >> ./Vagrantfile

echo "end" >> ./Vagrantfile

touch ./$directory/script2.sh

echo "#!/bin/bash" >> ./$directory/script2.sh
echo "cd /var/www/html" >> ./$directory/script2.sh
echo "sudo apt update" >> ./$directory/script2.sh
echo "sudo apt install apache2 -y" >> ./$directory/script2.sh
echo "mkdir CSS JS" >> ./$directory/script2.sh
echo "touch ./CSS/style.css" >> ./$directory/script2.sh
echo "touch ./JS/script.js" >> ./$directory/script2.sh

echo "Entrez le nom d'utilisateur que vous souhaitez créer!" 
read userName
echo "Entrez le mot de passe pour votre utilisateur"
read password
echo "sudo useradd -m $userName -p $password"  >> ./$directory/script2.sh

vagrant up
vagrant ssh
