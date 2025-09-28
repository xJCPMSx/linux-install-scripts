#!/bin/bash

# Script para corrigir problemas de transparência na GUI
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Corrigindo problemas de transparência da GUI${NC}"
echo "============================================="

# Detectar ambiente desktop
detect_desktop() {
    if [ -n "$XDG_CURRENT_DESKTOP" ]; then
        echo "$XDG_CURRENT_DESKTOP"
    elif [ -n "$DESKTOP_SESSION" ]; then
        echo "$DESKTOP_SESSION"
    elif [ -n "$GNOME_DESKTOP_SESSION_ID" ]; then
        echo "GNOME"
    elif [ -n "$KDE_FULL_SESSION" ]; then
        echo "KDE"
    else
        echo "UNKNOWN"
    fi
}

# Configurar variáveis de ambiente baseadas no desktop
setup_environment() {
    local desktop=$(detect_desktop)
    echo -e "${CYAN}🖥️ Ambiente detectado: $desktop${NC}"
    
    case "$desktop" in
        "KDE"|"kde"|"KDE"|"plasma")
            echo -e "${YELLOW}🔧 Configurando para KDE...${NC}"
            export QT_QPA_PLATFORM="xcb"
            export QT_AUTO_SCREEN_SCALE_FACTOR="1"
            export QT_SCALE_FACTOR="1"
            export KDE_FULL_SESSION="true"
            ;;
        "GNOME"|"gnome"|"ubuntu:GNOME")
            echo -e "${YELLOW}🔧 Configurando para GNOME...${NC}"
            export GTK_THEME="Adwaita"
            export GTK_CSD="0"
            export GDK_BACKEND="x11"
            ;;
        "XFCE"|"xfce")
            echo -e "${YELLOW}🔧 Configurando para XFCE...${NC}"
            export GTK_THEME="Adwaita"
            export GDK_BACKEND="x11"
            ;;
        *)
            echo -e "${YELLOW}🔧 Configurando ambiente genérico...${NC}"
            export GTK_THEME="Adwaita"
            export GDK_BACKEND="x11"
            ;;
    esac
    
    # Configurações comuns para todos os ambientes
    export GTK_IM_MODULE=""
    export QT_IM_MODULE=""
    export XMODIFIERS=""
    export GTK_CSD="0"
}

# Função para testar zenity com diferentes configurações
test_zenity() {
    echo -e "${CYAN}🧪 Testando zenity...${NC}"
    
    # Teste básico
    if zenity --version &> /dev/null; then
        echo -e "${GREEN}✅ Zenity funcionando${NC}"
        
        # Teste de diálogo com configurações de transparência
        echo -e "${YELLOW}🔍 Testando diálogo...${NC}"
        if zenity --info --title="Teste de Transparência" --text="Se você pode ver esta janela claramente, a transparência foi corrigida!" --width=400 --height=200 2>/dev/null; then
            echo -e "${GREEN}✅ Diálogo funcionando corretamente${NC}"
            return 0
        else
            echo -e "${RED}❌ Diálogo com problemas${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Zenity não funcionando${NC}"
        return 1
    fi
}

# Função para instalar dependências se necessário
install_dependencies() {
    echo -e "${CYAN}📦 Verificando dependências...${NC}"
    
    if ! command -v zenity &> /dev/null; then
        echo -e "${YELLOW}⚠️ Zenity não encontrado. Instalando...${NC}"
        if command -v zypper &> /dev/null; then
            sudo zypper install -y zenity
        elif command -v apt &> /dev/null; then
            sudo apt install -y zenity
        else
            echo -e "${RED}❌ Não foi possível instalar zenity${NC}"
            return 1
        fi
    fi
    
    # Instalar tema Adwaita se necessário
    if command -v zypper &> /dev/null; then
        sudo zypper install -y gtk3-metatheme-adwaita
    elif command -v apt &> /dev/null; then
        sudo apt install -y adwaita-icon-theme
    fi
}

# Função principal
main() {
    echo -e "${BLUE}🚀 Iniciando correção de transparência...${NC}"
    
    # Instalar dependências
    install_dependencies
    
    # Configurar ambiente
    setup_environment
    
    # Testar zenity
    if test_zenity; then
        echo -e "${GREEN}🎉 Problemas de transparência corrigidos!${NC}"
        echo -e "${CYAN}💡 Você pode agora executar: ./gui/gui-install-simple.sh${NC}"
    else
        echo -e "${RED}❌ Não foi possível corrigir os problemas${NC}"
        echo -e "${YELLOW}💡 Tente executar em um terminal diferente ou reiniciar o ambiente gráfico${NC}"
    fi
}

# Executar função principal
main "$@"
