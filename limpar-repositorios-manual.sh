#!/bin/bash

# Script de limpeza manual para resolver conflitos de repositórios
# Execute este script ANTES de executar o install-programs-debian.sh

echo "🧹 LIMPEZA MANUAL DE REPOSITÓRIOS CONFLITANTES"
echo "=============================================="
echo "📅 Data: $(date)"
echo "🐧 Sistema: $(lsb_release -d | cut -f2)"
echo ""

# Função para limpar repositórios conflitantes
limpar_repositorios_manual() {
    echo "🔧 Removendo TODOS os repositórios conflitantes..."
    
    # Limpar TODOS os repositórios problemáticos
    echo "   Removendo arquivos .list..."
    sudo rm -f /etc/apt/sources.list.d/vscode.list
    sudo rm -f /etc/apt/sources.list.d/google-chrome.list
    sudo rm -f /etc/apt/sources.list.d/brave-browser-release.list
    sudo rm -f /etc/apt/sources.list.d/spotify.list
    sudo rm -f /etc/apt/sources.list.d/microsoft.list
    sudo rm -f /etc/apt/sources.list.d/*.list
    
    # Limpar TODAS as chaves GPG conflitantes
    echo "   Removendo chaves GPG..."
    sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/google.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/brave-browser-archive-keyring.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/spotify.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/*.gpg
    
    # Limpar TODAS as chaves do keyrings
    echo "   Removendo chaves do keyrings..."
    sudo rm -f /usr/share/keyrings/microsoft.gpg
    sudo rm -f /usr/share/keyrings/google.gpg
    sudo rm -f /usr/share/keyrings/brave-browser-archive-keyring.gpg
    sudo rm -f /usr/share/keyrings/spotify.gpg
    sudo rm -f /usr/share/keyrings/*.gpg
    
    # Limpar cache do apt
    echo "   Limpando cache do apt..."
    sudo apt clean
    sudo apt autoclean
    
    echo "✅ Limpeza manual concluída!"
}

# Executar limpeza
limpar_repositorios_manual

# Testar se a limpeza funcionou
echo ""
echo "🧪 Testando se a limpeza funcionou..."
sudo apt update --allow-releaseinfo-change

if [ $? -eq 0 ]; then
    echo "✅ Limpeza bem-sucedida! Agora você pode executar o script de instalação."
    echo ""
    echo "📋 Próximos passos:"
    echo "1. Execute: ./install-programs-debian.sh"
    echo "2. O script deve funcionar sem erros de conflitos"
else
    echo "⚠️  Ainda há problemas. Tentando limpeza adicional..."
    sudo rm -f /etc/apt/sources.list.d/*.list
    sudo rm -f /etc/apt/trusted.gpg.d/*.gpg
    sudo rm -f /usr/share/keyrings/*.gpg
    sudo apt clean
    sudo apt autoclean
    sudo apt update --allow-releaseinfo-change
    echo "✅ Limpeza adicional concluída!"
fi

echo ""
echo "🎯 Agora execute o script de instalação:"
echo "   ./install-programs-debian.sh"
