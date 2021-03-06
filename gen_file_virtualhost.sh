#!/bin/bash
##################################################################################################################################
#Entradas para o shell script
# Entrada $1 = Domihnio do site que se deseja configurar, o mesmo que é registrado nas empresas de domihnio
# Entrada $2 = Nome do arquivo de configuração do VirtualHols, que tem extesão ".com.conf" e fica dentro do diretório /etc/apache2/sites-available
# Entrada $3 = Diretório de saída do arquivo que vai ser gerado pelo script, geralmente deve ser /etc/apache2/sites-available
##################################################################################################################################
domain_name=$1 #Entrada 01
file_name=$2 #Entrada 02
output_dir=$3 #Entrada 03
dir_name=$4 #Entrada 04

##################################################################################################################################
# Esse é o nome defaul que é dado para o arquivo wsgi
##################################################################################################################################
std_wsgi_name="project.wsgi"

##################################################################################################################################
# Início da geração do arquivo de configuração do Host
##################################################################################################################################
cat > $output_dir/$file_name".com.conf" << EOF1
<VirtualHost *:80>

	ServerName $domain_name

    	WSGIScriptAlias / $dir_name/$std_wsgi_name
        WSGIDaemonProcess python_app user=superpython group=sudo
        WSGIProcessGroup python_app
	
    	<Directory $dir_name/>
        	Order deny,allow
        	Allow from all
    	</Directory>

	Alias /static $dir_name/static/
	<Directory $dir_name/static/>
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	LogLevel warn
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF1

##################################################################################################################################
# Fim da geração do arquivo de configuração do Host
