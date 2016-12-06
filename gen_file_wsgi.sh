#!/bin/bash
##################################################################################################################################
#Entradas para o shell script
# Entrada $2 = Nome do arquivo WSGi
# Entrada $3 = Path(caminho) para o Diretório de saída, que deve ficar dentro do diretório raiz do projeto.
##################################################################################################################################
file_name=$1
output_dir=$2

##################################################################################################################################
# Esse é o nome default que é dado para o arquivo wsgi
##################################################################################################################################
std_wsgi_name=$file_name
std_app_name="project"

##################################################################################################################################
# Inicio da geraçao do arquivo WSGi
##################################################################################################################################
cat > $file_name.wsgi << EOF1
#!/usr/bin/env python
#-*- coding: utf-8 -*-
import sys
import logging

logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"$(pwd)")

activate_this = "$(pwd)/venv/bin/activate_this.py"
execfile(activate_this, dict(__file__=activate_this))

from $std_app_name import app as application
application.secret_key = 'Add your secret key'
EOF1
##################################################################################################################################
# Fim da criação do arquivo
##################################################################################################################################
