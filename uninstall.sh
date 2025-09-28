#!/bin/bash

# Script de Desinstalação - Linux Installation Scripts
# Remove programas instalados pelos scripts de instalação

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Função para exibir cabeçalho
show_header() {
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}🗑️  Script de Desinstalação Linux${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo -e "${BLUE}📅 Data: $(date)${NC}"
    echo -e "${BLUE}🐧 Sistema: $(uname -s) $(uname -r)${NC}"
    echo -e "${BLUE}🔧 Versão: Uninstall v1.0-beta${NC}"
    echo ""
}

# Função para detectar distribuição
detect_distribution() {
    echo -e "${YELLOW}🔍 Detectando distribuição Linux...${NC}"
    
    if [ -f /etc/os-release ]; then
        # shellcheck source=/dev/null
        . /etc/os-release
        DISTRO=$ID
        VERSION=$VERSION_ID
    elif [ -f /etc/redhat-release ]; then
        DISTRO="rhel"
    elif [ -f /etc/debian_version ]; then
        DISTRO="debian"
    else
        DISTRO="unknown"
    fi
    
    echo -e "${GREEN}✓ Distribuição detectada: $DISTRO${NC}"
    if [ -n "$VERSION" ]; then
        echo -e "${GREEN}✓ Versão: $VERSION${NC}"
    fi
    echo ""
}

# Função para confirmar desinstalação
confirm_uninstall() {
    echo -e "${YELLOW}⚠️  ATENÇÃO: Esta operação irá remover os seguintes programas:${NC}"
    echo -e "${RED}   - AnyDesk${NC}"
    echo -e "${RED}   - Spotify${NC}"
    echo -e "${RED}   - VSCode${NC}"
    echo -e "${RED}   - Cursor${NC}"
    echo -e "${RED}   - Google Chrome${NC}"
    echo -e "${RED}   - Brave Browser${NC}"
    echo -e "${RED}   - Firefox${NC}"
    echo -e "${RED}   - Java (OpenJDK)${NC}"
    echo -e "${RED}   - Node.js${NC}"
    echo -e "${RED}   - Osu!${NC}"
    echo -e "${RED}   - Extensões do VSCode${NC}"
    echo -e "${RED}   - Configurações do Git${NC}"
    echo -e "${RED}   - Ícones personalizados${NC}"
    echo ""
    echo -e "${YELLOW}💡 Você pode escolher quais programas remover.${NC}"
    echo ""
    read -p "Deseja continuar? (s/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        echo -e "${BLUE}❌ Desinstalação cancelada.${NC}"
        exit 0
    fi
}

# Função para desinstalar programas do openSUSE
uninstall_opensuse() {
    echo -e "${BLUE}🗑️  Desinstalando programas do openSUSE...${NC}"
    
    # Desinstalar AnyDesk
    echo -e "${YELLOW}Removendo AnyDesk...${NC}"
    sudo zypper remove -y anydesk 2>/dev/null || echo "AnyDesk não encontrado"
    
    # Desinstalar Spotify
    echo -e "${YELLOW}Removendo Spotify...${NC}"
    sudo zypper remove -y spotify-client 2>/dev/null || echo "Spotify não encontrado"
    
    # Desinstalar VSCode
    echo -e "${YELLOW}Removendo VSCode...${NC}"
    sudo zypper remove -y code 2>/dev/null || echo "VSCode não encontrado"
    
    # Desinstalar Google Chrome
    echo -e "${YELLOW}Removendo Google Chrome...${NC}"
    sudo zypper remove -y google-chrome-stable 2>/dev/null || echo "Chrome não encontrado"
    
    # Desinstalar Firefox
    echo -e "${YELLOW}Removendo Firefox...${NC}"
    sudo zypper remove -y MozillaFirefox 2>/dev/null || echo "Firefox não encontrado"
    
    # Desinstalar Java
    echo -e "${YELLOW}Removendo Java...${NC}"
    sudo zypper remove -y java-11-openjdk java-17-openjdk java-21-openjdk 2>/dev/null || echo "Java não encontrado"
    
    # Desinstalar Node.js
    echo -e "${YELLOW}Removendo Node.js...${NC}"
    sudo zypper remove -y nodejs npm 2>/dev/null || echo "Node.js não encontrado"
    
    # Remover repositórios adicionados
    echo -e "${YELLOW}Removendo repositórios adicionados...${NC}"
    sudo zypper removerepo google-chrome 2>/dev/null || echo "Repositório Google Chrome não encontrado"
    sudo zypper removerepo spotify 2>/dev/null || echo "Repositório Spotify não encontrado"
    
    # Remover chaves GPG
    echo -e "${YELLOW}Removendo chaves GPG...${NC}"
    sudo rpm -e --allmatches gpg-pubkey-* 2>/dev/null || echo "Chaves GPG não encontradas"
    
    echo -e "${GREEN}✓ Desinstalação do openSUSE concluída!${NC}"
}

# Função para desinstalar programas do Debian/Ubuntu
uninstall_debian() {
    echo -e "${BLUE}🗑️  Desinstalando programas do Debian/Ubuntu...${NC}"
    
    # Desinstalar AnyDesk
    echo -e "${YELLOW}Removendo AnyDesk...${NC}"
    sudo apt remove -y anydesk 2>/dev/null || echo "AnyDesk não encontrado"
    
    # Desinstalar Spotify
    echo -e "${YELLOW}Removendo Spotify...${NC}"
    sudo apt remove -y spotify-client 2>/dev/null || echo "Spotify não encontrado"
    flatpak uninstall -y com.spotify.Client 2>/dev/null || echo "Spotify Flatpak não encontrado"
    sudo snap remove spotify 2>/dev/null || echo "Spotify Snap não encontrado"
    
    # Desinstalar VSCode
    echo -e "${YELLOW}Removendo VSCode...${NC}"
    sudo apt remove -y code 2>/dev/null || echo "VSCode não encontrado"
    flatpak uninstall -y com.visualstudio.code 2>/dev/null || echo "VSCode Flatpak não encontrado"
    
    # Desinstalar Google Chrome
    echo -e "${YELLOW}Removendo Google Chrome...${NC}"
    sudo apt remove -y google-chrome-stable 2>/dev/null || echo "Chrome não encontrado"
    
    # Desinstalar Brave Browser
    echo -e "${YELLOW}Removendo Brave Browser...${NC}"
    sudo apt remove -y brave-browser 2>/dev/null || echo "Brave não encontrado"
    flatpak uninstall -y com.brave.Browser 2>/dev/null || echo "Brave Flatpak não encontrado"
    
    # Desinstalar Firefox
    echo -e "${YELLOW}Removendo Firefox...${NC}"
    sudo apt remove -y firefox 2>/dev/null || echo "Firefox não encontrado"
    
    # Desinstalar Java
    echo -e "${YELLOW}Removendo Java...${NC}"
    sudo apt remove -y openjdk-11-jdk openjdk-11-jre openjdk-17-jdk openjdk-17-jre openjdk-21-jdk openjdk-21-jre default-jdk default-jre 2>/dev/null || echo "Java não encontrado"
    
    # Desinstalar Node.js
    echo -e "${YELLOW}Removendo Node.js...${NC}"
    sudo apt remove -y nodejs npm 2>/dev/null || echo "Node.js não encontrado"
    
    # Remover repositórios adicionados
    echo -e "${YELLOW}Removendo repositórios adicionados...${NC}"
    sudo rm -f /etc/apt/sources.list.d/google-chrome.list
    sudo rm -f /etc/apt/sources.list.d/spotify.list
    sudo rm -f /etc/apt/sources.list.d/microsoft.list
    sudo rm -f /etc/apt/sources.list.d/vscode.list
    
    # Remover chaves GPG
    echo -e "${YELLOW}Removendo chaves GPG...${NC}"
    sudo rm -f /etc/apt/trusted.gpg.d/google.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/spotify.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo rm -f /usr/share/keyrings/google.gpg
    sudo rm -f /usr/share/keyrings/spotify.gpg
    sudo rm -f /usr/share/keyrings/microsoft.gpg
    
    # Limpar cache
    echo -e "${YELLOW}Limpando cache...${NC}"
    sudo apt autoremove -y
    sudo apt autoclean
    
    echo -e "${GREEN}✓ Desinstalação do Debian/Ubuntu concluída!${NC}"
}

# Função para remover arquivos personalizados
remove_custom_files() {
    echo -e "${BLUE}🗑️  Removendo arquivos personalizados...${NC}"
    
    # Remover Cursor
    echo -e "${YELLOW}Removendo Cursor...${NC}"
    rm -f ~/Applications/cursor.AppImage 2>/dev/null || echo "Cursor não encontrado"
    rm -f ~/.local/share/applications/cursor.desktop 2>/dev/null || echo "Desktop file do Cursor não encontrado"
    rm -f ~/.local/share/icons/cursor.svg 2>/dev/null || echo "Ícone do Cursor não encontrado"
    
    # Remover Osu!
    echo -e "${YELLOW}Removendo Osu!...${NC}"
    rm -f ~/Applications/osu.AppImage 2>/dev/null || echo "Osu! não encontrado"
    rm -f ~/.local/share/applications/osu.desktop 2>/dev/null || echo "Desktop file do Osu! não encontrado"
    rm -f ~/.local/share/icons/osu.svg 2>/dev/null || echo "Ícone do Osu! não encontrado"
    
    # Remover configurações do Git
    echo -e "${YELLOW}Removendo configurações do Git...${NC}"
    git config --global --unset user.name 2>/dev/null || echo "Configuração user.name não encontrada"
    git config --global --unset user.email 2>/dev/null || echo "Configuração user.email não encontrada"
    
    # Remover extensões do VSCode
    echo -e "${YELLOW}Removendo extensões do VSCode...${NC}"
    code --uninstall-extension ms-python.python 2>/dev/null || echo "Extensão Python não encontrada"
    code --uninstall-extension ms-vscode.cpptools 2>/dev/null || echo "Extensão C++ não encontrada"
    
    echo -e "${GREEN}✓ Arquivos personalizados removidos!${NC}"
}

# Função para limpar configurações
clean_configurations() {
    echo -e "${BLUE}🧹 Limpando configurações...${NC}"
    
    # Limpar configurações do Java
    echo -e "${YELLOW}Limpando configurações do Java...${NC}"
    sudo update-alternatives --remove-all java 2>/dev/null || echo "Alternativas do Java não encontradas"
    
    # Limpar configurações do Flatpak
    echo -e "${YELLOW}Limpando configurações do Flatpak...${NC}"
    flatpak uninstall --unused -y 2>/dev/null || echo "Flatpak não configurado"
    
    # Limpar cache
    echo -e "${YELLOW}Limpando cache...${NC}"
    rm -rf ~/.cache/spotify 2>/dev/null || echo "Cache do Spotify não encontrado"
    rm -rf ~/.cache/google-chrome 2>/dev/null || echo "Cache do Chrome não encontrado"
    rm -rf ~/.cache/brave-browser 2>/dev/null || echo "Cache do Brave não encontrado"
    
    echo -e "${GREEN}✓ Configurações limpas!${NC}"
}

# Função para exibir resumo
show_summary() {
    echo ""
    echo -e "${GREEN}✅ Desinstalação concluída com sucesso!${NC}"
    echo ""
    echo -e "${BLUE}📋 Resumo da desinstalação:${NC}"
    echo -e "${CYAN}   - Programas removidos${NC}"
    echo -e "${CYAN}   - Repositórios removidos${NC}"
    echo -e "${CYAN}   - Chaves GPG removidas${NC}"
    echo -e "${CYAN}   - Arquivos personalizados removidos${NC}"
    echo -e "${CYAN}   - Configurações limpas${NC}"
    echo ""
    echo -e "${YELLOW}💡 Para reinstalar os programas, execute:${NC}"
    echo -e "${CYAN}   ./auto-install.sh${NC}"
    echo ""
}

# Função principal
main() {
    show_header
    detect_distribution
    confirm_uninstall
    
    case $DISTRO in
        "opensuse"|"opensuse-leap"|"opensuse-tumbleweed")
            uninstall_opensuse
            ;;
        "debian"|"ubuntu"|"linuxmint"|"pop"|"elementary"|"zorin"|"kali")
            uninstall_debian
            ;;
        *)
            echo -e "${RED}❌ Distribuição não suportada: $DISTRO${NC}"
            exit 1
            ;;
    esac
    
    remove_custom_files
    clean_configurations
    show_summary
}

# Executar função principal
main
