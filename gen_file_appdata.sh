#!/bin/bash
##################################################################################################################################
#Entradas para o shell script
# 1 - Nome que será dado ao database
# 2 - Nome do usuário mysql
# 3 - Password database mysql
##################################################################################################################################
database_name=$1
database_username=$2
database_userpw=$3

##################################################################################################################################
# Inicio da geraçao do arquivo WSGi
##################################################################################################################################
cat > appdatabase.py << EOF1
#!/usr/bin/env python
#-*- coding: utf-8 -*-
DBPATH = "mysql://$database_username:$database_userpw@localhost/$database_name"
DBPATH_ENGINE = "mysql://$database_username:$database_userpw@localhost"
DATABASE_NAME = "$database_name"
DATABASE_USERNAME = "$database_username"
DATABASE_PW = "$database_userpw"

EOF1
##################################################################################################################################
# Fim da criação do arquivo
##################################################################################################################################
