#!/bin/bash

DATABASE_name="foodstore_db"
DATABASE_username="root"
DATABASE_password="foodstoreapp"

if [ -d "/home/vagrant/" ] 
then #VAGRANT
    echo "Bem vindo ao VAGRANT"    
    #Script para instalar git,mysql,apache,python 2.7.9 *system wide, pip,venv,requirements.txt
    chmod +x setup_vagrant.sh 
    sudo sh setup_vagrant.sh

    #Script para gerar o arquivo de VirtualHost, para configuração do Site. 
    chmod +x gen_file_virtualhost.sh
    sudo sh gen_file_virtualhost.sh www.foodstore.com.br foodstore /etc/apache2/sites-available/
    
    #Scritop para gerar o arquivo wsgi
    # input:
    # 1 - file name: project
    # 2 - path
    sudo sh gen_file_wsgi.sh project $(pwd)/

    #Cria um arquivo contendo dados para a aplicação python (appdatabase.py) e também
    #cria um database com o nome passado nos argumentos do comando
    sh create_mysql_database.sh $DATABASE_name $DATABASE_username $DATABASE_password

else #DIGITALOCEAN
    echo "Bem vindo ao DIGITAL OCEAN"
    chmod +x setup_digitalocean.sh 
    sh setup_digitalocean.sh
fi
