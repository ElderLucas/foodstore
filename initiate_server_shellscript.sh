#!/bin/sh


# _ Pre requisitos antes de executar esse script:
# _ 1 _ Alterar o Arquivo create_database.py para que os dados do Adminstrador do database
#       estejam corretos. (Na linha que contenha o comando "sqlalchemy.create_engine")

# "vagrant up 
# 1 - O primeiro Comando eh para iniciar uma vagrant machin com um Vagrant file existente.
# 2 - Esse comando uma o Vagrant File local para inciar a maquina.
# 3 - Atentese para o port configuradon no arquivo do vagrant
# "vagrant ssh
# 1 - Acessamos nossa maquina Vagrant

apt-get update  # To get the latest package lists

apt-get install apache2

apt-get install mysql-server mysql-client

apt-get install build-essential python-dev libmysqlclient-dev

apt-get install libapache2-mod-wsgi

a2enmod wsgi

service apache2 restart

apt-get install python-pip

pip install virtualenv

apt-get install git

git config --global user.email "elderlucas@gmail.com"

git config --global user.name "ElderLucas"

pip install mysql-python

./bootstrap.sh

#### 1
virtualenv venv

. venv/bin/activate

pip install -r requirements.txt

# Altere os Dados do DataBAse Caso Seja Necessário
# python create_database.py
# sudo a2dissite 000-default
# sudo a2ensite nomedomeusite.com.conf

#etc.