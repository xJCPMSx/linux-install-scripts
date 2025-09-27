#!/bin/bash

# Script de limpeza de repositórios conflitantes
# Resolve problemas de chaves GPG e repositórios conflitantes

echo "🧹 Limpando repositórios conflitantes..."
echo "========================================"

# Limpar todos os repositórios problemáticos
echo "Removendo repositórios conflitantes..."
sudo rm -f /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/sources.list.d/google-chrome.list
sudo rm -f /etc/apt/sources.list.d/brave-browser-release.list
sudo rm -f /etc/apt/sources.list.d/spotify.list
sudo rm -f /etc/apt/sources.list.d/microsoft.list

# Limpar todas as chaves GPG conflitantes
echo "Removendo chaves GPG conflitantes..."
sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg
sudo rm -f /etc/apt/trusted.gpg.d/google.gpg
sudo rm -f /etc/apt/trusted.gpg.d/brave-browser-archive-keyring.gpg
sudo rm -f /etc/apt/trusted.gpg.d/spotify.gpg

# Limpar chaves do keyrings
echo "Removendo chaves do keyrings..."
sudo rm -f /usr/share/keyrings/microsoft.gpg
sudo rm -f /usr/share/keyrings/google.gpg
sudo rm -f /usr/share/keyrings/brave-browser-archive-keyring.gpg
sudo rm -f /usr/share/keyrings/spotify.gpg

# Limpar cache do apt
echo "Limpando cache do apt..."
sudo apt clean
sudo apt autoclean

# Atualizar lista de pacotes
echo "Atualizando lista de pacotes..."
sudo apt update

echo "✅ Limpeza concluída com sucesso!"
echo "Agora você pode executar o script de instalação novamente."
