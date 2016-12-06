#!/bin/bash

if [ -d "/home/vagrant/" ] 
then
    echo "Bem vindo ao VAGRANT"
    chmod +x setup_vagrant.sh 
    sh setup_vagrant.sh
    chmod +x gen_file_virtualhost.sh
    sudo sh gen_file_virtualhost.sh www.foodstore.com.br foodstore /etc/apache2/sites-available/
    sudo sh gen_file_wsgi.sh project $(pwd)/
else
    echo "Bem vindo ao DIGITAL OCEAN"
    chmod +x setup_digitalocean.sh 
    sh setup_digitalocean.sh
fi

