#!/bin/bash

DATABASE_name="foodstore_db"
DATABASE_username="root"
DATABASE_password="foodstoreapp"
DOMINIO="www.foodstore.com.br"
VIRTUALHOST_NAME="foodstore.com.conf"

#Argumentos de Entrada:
# 1 - CurrentPathPWD
INPUT_DIR=$1

if [ -d "/home/vagrant/" ] 
then #VAGRANT
    
    echo "Bem vindo ao VAGRANT"    
    #Script para instalar git,mysql,apache,python 2.7.9 *system wide, pip,venv,requirements.txt
    echo "===>[1] Vagrant Install "  
    chmod +x setup_vagrant.sh 
    #sudo sh setup_vagrant.sh

    echo "===>[2] VIRTUAL HOST File Generate "      
    #Script para gerar o arquivo de VirtualHost, para configuração do Site. 
    chmod +x gen_file_virtualhost.sh
    sh gen_file_virtualhost.sh www.foodstore.com.br foodstore /etc/apache2/sites-available/ $INPUT_DIR
    
    #Scritop para gerar o arquivo wsgi
    # input:
    # 1 - file name: project
    # 2 - path
    echo "===>[3] WGSI  File Generate "  
    sh gen_file_wsgi.sh project $INPUT_DIR/

    a2ensite /etc/apache2/sites-available/foodstore.com.conf

    #Cria um arquivo contendo dados para a aplicação python (appdatabase.py) e também
    #cria um database com o nome passado nos argumentos do comando
    echo "===>[4] Database Creator [ $DATABASE_name ]"
    sh create_mysql_database.sh $DATABASE_name $DATABASE_username $DATABASE_password

    echo "===>[5] Apache2 : Enable Site[ $DOMINIO ]"
    sudo a2dissite 000-default.conf
    sudo a2ensite VIRTUALHOST_NAME

else #DIGITALOCEAN
    echo "Bem vindo ao DIGITAL OCEAN"
    chmod +x setup_digitalocean.sh 
    sh setup_digitalocean.sh
fi
