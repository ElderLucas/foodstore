echo "### EXECUTANDO UM SCRIPT DE INSTALAÇÃO DO DIGITAL OCEAN ###"

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
