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

#Instalando o gerenciador de pacotes python
sudo apt-get install python-pip
sudo pip install -U pip setuptools

#Instalando o virtualenvironment para criar um ambiente "padronizado"
sudo pip install virtualenv

#Cria-se um ambiente virtual nomeado 
sudo virtualenv -p /usr/local/lib/python2.7.9/bin/python /var/www/venv

#Instalações para o e do MySql
sudo apt-get install mysql-server mysql-client
sudo apt-get install build-essential python-dev libmysqlclient-dev
sudo apt-get install libapache2-mod-wsgi

#Ativando o ambiente Virtual
. venv/bin/activate
pip install mysql-python
pip install -r req.txt
