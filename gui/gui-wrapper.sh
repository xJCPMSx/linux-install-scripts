#!/bin/bash

# Wrapper para Interface Gráfica - Linux Install Scripts
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}🖥️ Linux Install Scripts - Interface Gráfica${NC}"
echo "============================================="

# Verificar se está em modo gráfico
if [ -z "$DISPLAY" ]; then
    echo -e "${RED}❌ Erro: Interface gráfica não disponível${NC}"
    echo "Execute em um ambiente gráfico ou use os scripts de linha de comando:"
    echo "  ./auto-install.sh    - Instalação automática"
    echo "  ./uninstall.sh       - Desinstalação"
    exit 1
fi

# Verificar se zenity está disponível
if ! command -v zenity &> /dev/null; then
    echo -e "${YELLOW}⚠️ Zenity não encontrado. Tentando instalar...${NC}"
    
    if command -v zypper &> /dev/null; then
        echo "Instalando zenity via zypper..."
        sudo zypper install -y zenity
    elif command -v apt &> /dev/null; then
        echo "Instalando zenity via apt..."
        sudo apt install -y zenity
    else
        echo -e "${RED}❌ Não foi possível instalar zenity automaticamente${NC}"
        echo "Por favor, instale zenity manualmente:"
        echo "  openSUSE: sudo zypper install zenity"
        echo "  Debian/Ubuntu: sudo apt install zenity"
        exit 1
    fi
fi

# Verificar se zenity funciona
echo -e "${CYAN}🔍 Testando zenity...${NC}"
if ! zenity --version &> /dev/null; then
    echo -e "${RED}❌ Zenity não está funcionando corretamente${NC}"
    echo "Tentando executar versão simplificada..."
    
    # Executar versão simplificada sem zenity
    echo -e "${YELLOW}📋 Menu de Opções (Linha de Comando):${NC}"
    echo "1. 🚀 Instalação Automática"
    echo "2. 🗑️ Desinstalação"
    echo "3. 💾 Backup"
    echo "4. 📊 Estatísticas"
    echo "5. 🚪 Sair"
    
    read -p "Escolha uma opção (1-5): " choice
    
    case "$choice" in
        1)
            echo -e "${GREEN}🚀 Executando instalação automática...${NC}"
            ./auto-install.sh
            ;;
        2)
            echo -e "${YELLOW}🗑️ Executando desinstalação...${NC}"
            ./uninstall.sh
            ;;
        3)
            echo -e "${BLUE}💾 Executando backup...${NC}"
            ./backup/backup.sh create
            ;;
        4)
            echo -e "${CYAN}📊 Mostrando estatísticas...${NC}"
            ./backup/backup.sh stats
            ;;
        5)
            echo -e "${GREEN}👋 Saindo...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Opção inválida${NC}"
            exit 1
            ;;
    esac
    exit 0
fi

echo -e "${GREEN}✅ Zenity funcionando corretamente${NC}"

# Configurar variáveis de ambiente para suprimir warnings
export GTK_IM_MODULE=""
export QT_IM_MODULE=""
export XMODIFIERS=""

# Executar GUI simplificada
echo -e "${CYAN}🖥️ Iniciando interface gráfica...${NC}"
./gui/gui-install-simple.sh
