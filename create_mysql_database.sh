#!/bin/bash

DATABASE_name=$1
DATABASE_username=$2
DATABASE_password=$3

# Script que gera o arquivo python com as variaveis que contem os valores de configiração do database
# Tais variaveis serão usadas durante a "criação do database" da aplicação
sh gen_file_appdata.sh $DATABASE_name $DATABASE_username $DATABASE_password

#Comando MYSQL para criar o banco de dados para a aplicação
echo "create database $DATABASE_name" | mysql --user=$DATABASE_username --password=$DATABASE_password
