echo "### EXECUTANDO UM SCRIPT DE INSTALAÇÃO DO VAGRANT ###"

apt-get update  #To get the latest package lists

# Instalando o Git, caso não esteja instalado na Máquina
sudo apt-get install git
# Configurando o github
echo -n "Digite o Github User Email > "
read git_user_email
echo "Seu Git User Email: $git_user_email"
git config --global user.email git_user_email

echo -n "Digite o Github User Name > "
read git_user_name
echo "Seu Git User Name: $git_user_name"
git config --global user.name git_user_name

# Instalando e configurando o web server Apache2
echo -n "Instalando o Apache2"
apt-get install apache2

#Instalando também algumas
echo -n "Instalando algumas Dependências MySQL e PythonDEV"
apt-get install mysql-server mysql-client
apt-get install build-essential python-dev libmysqlclient-dev
apt-get install libapache2-mod-wsgi
a2enmod wsgi
service apache2 restart

echo -n "Update Ubuntu para udate no Python 2.7.x - 2.7.9"
#Somente se estiver usando a versão Ubuntu 14.04 LTS
apt-get install -y gcc-multilib g++-multilib libffi-dev libffi6 libffi6-dbg python-crypto python-mox3 python-pil python-ply libssl-dev zlib1g-dev libbz2-dev libexpat1-dev libbluetooth-dev libgdbm-dev dpkg-dev quilt autotools-dev libreadline-dev libtinfo-dev libncursesw5-dev tk-dev blt-dev libssl-dev zlib1g-dev libbz2-dev libexpat1-dev libbluetooth-dev libsqlite3-dev libgpm2 mime-support netbase net-tools bzip2

#Comandos para instalar o Python 2.7.9
wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
tar xfz Python-2.7.9.tgz
cd Python-2.7.9/
./configure --prefix /usr/local/lib/python2.7.9 --enable-ipv6

#Verificar a necessidade  de executar tais comandos como super usuário
make
make install

echo -n "Instalando Gerenciador de Pacotes Python"
apt-get install python-pip
sudo pip install -U pip setuptools
sudo pip install virtualenv

# Cria-se um virtual environment chamado venv, dentro do diretório atual "$(pwd)/", e atrela-se a ele a versão 2.7.9 do Python
# Essa versao do Python suporta SSL para conexoes seguras. 
echo -n "PIP### Instalando Virtualenv"
sudo virtualenv -p /usr/local/lib/python2.7.9/bin/python $(pwd)/venv

# Crinado um ambiente virtual para a aplicação. Nesta versão será feito o upgrade do Python
virtualenv venv
. venv/bin/activate
pip install -r requirements.txt
. deactivate
echo -n "PIP### requirements Instalados"
