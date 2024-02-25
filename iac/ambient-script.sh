#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install curl -y

#sudo curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh ./get-docker.sh --dry-run

# Instala as dependências necessárias para adicionar repositórios via HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adiciona o repositório do Docker ao sistema
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualiza novamente o cache do apt após adicionar o repositório do Docker
sudo apt update

# Instala o Docker
sudo apt install -y docker-ce


sudo docker run -dti --name httpd -p 80:80 lucaaraujo/meusite-bootcamp-devops:1.0