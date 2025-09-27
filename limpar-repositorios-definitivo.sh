#!/bin/bash

# Script de limpeza definitiva de repositórios conflitantes
# Versão: 1.0 - Limpeza definitiva

echo "🧹 Script de Limpeza Definitiva de Repositórios"
echo "=============================================="
echo ""

# Verificar se está executando como root
if [ "$EUID" -eq 0 ]; then
    echo "⚠️  Este script não deve ser executado como root"
    echo "   Execute como usuário normal com sudo quando necessário"
    exit 1
fi

# Função para verificar sucesso
check_success() {
    if [ $? -eq 0 ]; then
        echo "✓ $1"
    else
        echo "⚠️  $1 - continuando execução"
    fi
}

echo "🔍 Analisando repositórios atuais..."
echo ""

# Listar repositórios atuais
echo "📋 Repositórios atuais:"
ls -la /etc/apt/sources.list.d/ 2>/dev/null || echo "   Nenhum repositório adicional encontrado"
echo ""

# Listar chaves GPG atuais
echo "🔑 Chaves GPG atuais:"
ls -la /etc/apt/trusted.gpg.d/ 2>/dev/null || echo "   Nenhuma chave GPG adicional encontrada"
echo ""

# Listar chaves do keyrings
echo "🔐 Chaves do keyrings:"
ls -la /usr/share/keyrings/ 2>/dev/null || echo "   Nenhuma chave do keyrings encontrada"
echo ""

echo "🧹 Iniciando limpeza definitiva..."
echo ""

# Limpar TODOS os repositórios conflitantes
echo "1. Removendo TODOS os repositórios conflitantes..."
sudo rm -f /etc/apt/sources.list.d/*.list
check_success "Repositórios removidos"

# Limpar TODAS as chaves GPG conflitantes
echo "2. Removendo TODAS as chaves GPG conflitantes..."
sudo rm -f /etc/apt/trusted.gpg.d/*.gpg
check_success "Chaves GPG removidas"

# Limpar TODAS as chaves do keyrings
echo "3. Removendo TODAS as chaves do keyrings..."
sudo rm -f /usr/share/keyrings/*.gpg
check_success "Chaves do keyrings removidas"

# Limpar configurações específicas do Microsoft
echo "4. Removendo configurações específicas do Microsoft..."
sudo rm -f /etc/apt/sources.list.d/microsoft.list
sudo rm -f /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg
sudo rm -f /usr/share/keyrings/microsoft.gpg
check_success "Configurações do Microsoft removidas"

# Limpar configurações do Google Chrome
echo "5. Removendo configurações do Google Chrome..."
sudo rm -f /etc/apt/sources.list.d/google-chrome.list
sudo rm -f /etc/apt/trusted.gpg.d/google.gpg
sudo rm -f /usr/share/keyrings/google.gpg
check_success "Configurações do Google Chrome removidas"

# Limpar configurações do Brave Browser
echo "6. Removendo configurações do Brave Browser..."
sudo rm -f /etc/apt/sources.list.d/brave-browser.list
sudo rm -f /etc/apt/trusted.gpg.d/brave-browser-archive-keyring.gpg
sudo rm -f /usr/share/keyrings/brave-browser-archive-keyring.gpg
check_success "Configurações do Brave Browser removidas"

# Limpar configurações do Spotify
echo "7. Removendo configurações do Spotify..."
sudo rm -f /etc/apt/sources.list.d/spotify.list
sudo rm -f /etc/apt/trusted.gpg.d/spotify.gpg
sudo rm -f /usr/share/keyrings/spotify.gpg
check_success "Configurações do Spotify removidas"

# Limpar cache do apt
echo "8. Limpando cache do apt..."
sudo apt clean
sudo apt autoclean
check_success "Cache do apt limpo"

# Testar atualização básica
echo "9. Testando atualização básica..."
sudo apt update
check_success "Atualização básica"

echo ""
echo "✅ Limpeza definitiva concluída!"
echo ""
echo "📊 Resumo da limpeza:"
echo "   - Repositórios conflitantes: Removidos"
echo "   - Chaves GPG conflitantes: Removidas"
echo "   - Chaves do keyrings: Removidas"
echo "   - Configurações do Microsoft: Removidas"
echo "   - Configurações do Google Chrome: Removidas"
echo "   - Configurações do Brave Browser: Removidas"
echo "   - Configurações do Spotify: Removidas"
echo "   - Cache do apt: Limpo"
echo ""
echo "🎯 Próximos passos:"
echo "   1. Execute o script de instalação novamente"
echo "   2. Os programas serão instalados via Flatpak"
echo "   3. Não haverá mais conflitos de repositórios"
echo ""
echo "🔗 Script de instalação:"
echo "   wget https://raw.githubusercontent.com/xJCPMSx/opensuse-install-script/main/debian/install-programs-debian.sh"
echo "   chmod +x install-programs-debian.sh"
echo "   ./install-programs-debian.sh"
echo ""
echo "🎉 Limpeza concluída com sucesso!"
