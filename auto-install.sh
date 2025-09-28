#!/bin/bash

# Script de Detecção Automática e Instalação
# Detecta a distribuição Linux e executa o script apropriado

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
    echo -e "${CYAN}🚀 Auto-Install Linux Scripts${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo -e "${BLUE}📅 Data: $(date)${NC}"
    echo -e "${BLUE}🐧 Sistema: $(uname -s) $(uname -r)${NC}"
    echo -e "${BLUE}🔧 Versão: Auto-Detection v1.0${NC}"
    echo ""
}

# Função para detectar distribuição
detect_distribution() {
    echo -e "${YELLOW}🔍 Detectando distribuição Linux...${NC}"
    
    if [ -f /etc/os-release ]; then
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
    if [ ! -z "$VERSION" ]; then
        echo -e "${GREEN}✓ Versão: $VERSION${NC}"
    fi
    echo ""
}

# Função para executar script apropriado
run_appropriate_script() {
    case $DISTRO in
        "opensuse"|"opensuse-leap"|"opensuse-tumbleweed")
            echo -e "${BLUE}🎯 Executando script para openSUSE...${NC}"
            if [ -f "opensuse/install-programs.sh" ]; then
                chmod +x opensuse/install-programs.sh
                ./opensuse/install-programs.sh
            else
                echo -e "${RED}❌ Script do openSUSE não encontrado!${NC}"
                echo -e "${YELLOW}💡 Baixe o repositório completo:${NC}"
                echo -e "${CYAN}git clone https://github.com/xJCPMSx/linux-install-scripts.git${NC}"
                exit 1
            fi
            ;;
        "debian"|"ubuntu"|"linuxmint"|"pop"|"elementary"|"zorin"|"kali")
            echo -e "${BLUE}🎯 Executando script para Debian/Ubuntu...${NC}"
            if [ -f "debian/install-programs-debian.sh" ]; then
                chmod +x debian/install-programs-debian.sh
                ./debian/install-programs-debian.sh
            else
                echo -e "${RED}❌ Script do Debian/Ubuntu não encontrado!${NC}"
                echo -e "${YELLOW}💡 Baixe o repositório completo:${NC}"
                echo -e "${CYAN}git clone https://github.com/xJCPMSx/linux-install-scripts.git${NC}"
                exit 1
            fi
            ;;
        "arch"|"manjaro")
            echo -e "${YELLOW}⚠️  Arch Linux detectado!${NC}"
            echo -e "${YELLOW}💡 Suporte para Arch Linux será adicionado em versões futuras.${NC}"
            echo -e "${CYAN}📋 Por enquanto, use o AUR ou instale manualmente os programas.${NC}"
            exit 0
            ;;
        "fedora"|"rhel"|"centos")
            echo -e "${YELLOW}⚠️  Fedora/RHEL/CentOS detectado!${NC}"
            echo -e "${YELLOW}💡 Suporte para essas distribuições será adicionado em versões futuras.${NC}"
            echo -e "${CYAN}📋 Por enquanto, use o DNF/YUM ou instale manualmente os programas.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Distribuição não suportada: $DISTRO${NC}"
            echo -e "${YELLOW}💡 Distribuições suportadas:${NC}"
            echo -e "${CYAN}   - openSUSE (Leap, Tumbleweed)${NC}"
            echo -e "${CYAN}   - Debian/Ubuntu e derivados${NC}"
            echo -e "${CYAN}   - Linux Mint, Pop!_OS, Elementary OS, Zorin OS${NC}"
            echo -e "${CYAN}   - Kali Linux${NC}"
            exit 1
            ;;
    esac
}

# Função para exibir informações de suporte
show_support_info() {
    echo ""
    echo -e "${PURPLE}📞 Suporte e Informações:${NC}"
    echo -e "${CYAN}🔗 Repositório: https://github.com/xJCPMSx/linux-install-scripts${NC}"
    echo -e "${CYAN}📋 Issues: https://github.com/xJCPMSx/linux-install-scripts/issues${NC}"
    echo -e "${CYAN}📖 Documentação: README.md${NC}"
    echo ""
}

# Função principal
main() {
    show_header
    detect_distribution
    run_appropriate_script
    show_support_info
}

# Verificar se está sendo executado como root
if [ "$EUID" -eq 0 ]; then
    echo -e "${YELLOW}⚠️  Executando como root. Alguns programas podem ser instalados em locais diferentes.${NC}"
    echo ""
fi

# Executar função principal
main
