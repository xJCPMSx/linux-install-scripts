#!/bin/bash

# Correção simples de transparência - sem sudo
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Correção Simples de Transparência${NC}"
echo "============================================="

# Configurar variáveis de ambiente para corrigir transparência
setup_environment() {
    echo -e "${CYAN}🔧 Configurando variáveis de ambiente...${NC}"
    
    # Configurações para corrigir transparência
    export GTK_THEME="Adwaita"
    export GTK_CSD="0"
    export GDK_BACKEND="x11"
    export GTK_IM_MODULE=""
    export QT_IM_MODULE=""
    export XMODIFIERS=""
    
    # Configurações específicas para KDE
    if [ -n "$KDE_FULL_SESSION" ] || [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
        echo -e "${YELLOW}🖥️ Detectado KDE - Configurando variáveis específicas...${NC}"
        export QT_QPA_PLATFORM="xcb"
        export QT_AUTO_SCREEN_SCALE_FACTOR="1"
        export QT_SCALE_FACTOR="1"
    fi
    
    echo -e "${GREEN}✅ Variáveis configuradas${NC}"
}

# Função para testar zenity
test_zenity() {
    echo -e "${CYAN}🧪 Testando zenity...${NC}"
    
    if zenity --version &> /dev/null; then
        echo -e "${GREEN}✅ Zenity funcionando${NC}"
        
        # Teste simples
        echo -e "${YELLOW}🔍 Testando diálogo...${NC}"
        if zenity --info --title="Teste" --text="Teste de transparência" --width=300 --height=150 2>/dev/null; then
            echo -e "${GREEN}✅ Diálogo funcionando${NC}"
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

# Função para executar GUI com configurações corrigidas
run_gui() {
    echo -e "${CYAN}🖥️ Executando GUI com configurações corrigidas...${NC}"
    ./gui/gui-install-simple.sh
}

# Função principal
main() {
    # Configurar ambiente
    setup_environment
    
    # Testar zenity
    if test_zenity; then
        echo -e "${GREEN}🎉 Transparência corrigida!${NC}"
        echo -e "${CYAN}💡 Executando GUI...${NC}"
        run_gui
    else
        echo -e "${YELLOW}⚠️ Ainda há problemas com zenity${NC}"
        echo -e "${CYAN}💡 Tentando executar GUI mesmo assim...${NC}"
        run_gui
    fi
}

# Executar função principal
main "$@"
