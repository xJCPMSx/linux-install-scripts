#!/bin/bash

# Interface Gráfica - Linux Installation Scripts
# GUI simples para seleção de programas

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configurações
TEMP_CONFIG="/tmp/linux-install-config.conf"
SELECTED_PROGRAMS=()

# Função para exibir cabeçalho
show_header() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}🖥️  Interface Gráfica - Linux Scripts${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo -e "${BLUE}📅 Data: $(date)${NC}"
    echo -e "${BLUE}🐧 Sistema: $(uname -s) $(uname -r)${NC}"
    echo -e "${BLUE}🔧 Versão: GUI v1.0${NC}"
    echo ""
}

# Função para detectar distribuição
detect_distribution() {
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

# Função para exibir menu principal
show_main_menu() {
    echo -e "${YELLOW}🎯 Selecione os programas para instalar:${NC}"
    echo ""
    echo -e "${BLUE}🔧 Ferramentas de Desenvolvimento:${NC}"
    echo "  [1] GCC, G++, Make, CMake, Ninja"
    echo "  [2] Java (OpenJDK)"
    echo "  [3] Node.js"
    echo "  [4] Git"
    echo ""
    echo -e "${BLUE}📝 Editores de Código:${NC}"
    echo "  [5] VSCode"
    echo "  [6] Cursor (AI)"
    echo ""
    echo -e "${BLUE}🌐 Navegadores:${NC}"
    echo "  [7] Google Chrome"
    echo "  [8] Brave Browser"
    echo "  [9] Firefox"
    echo ""
    echo -e "${BLUE}🎵 Multimídia:${NC}"
    echo "  [10] Spotify"
    echo "  [11] Osu!"
    echo ""
    echo -e "${BLUE}🛠️  Ferramentas:${NC}"
    echo "  [12] AnyDesk"
    echo "  [13] Driver Huion Tablet"
    echo ""
    echo -e "${BLUE}⚙️  Opções:${NC}"
    echo "  [14] Instalar Tudo"
    echo "  [15] Instalar Selecionados"
    echo "  [16] Ver Seleção Atual"
    echo "  [17] Limpar Seleção"
    echo "  [18] Sair"
    echo ""
}

# Função para processar seleção
process_selection() {
    local choice=$1
    
    case $choice in
        1)
            SELECTED_PROGRAMS+=("gcc" "g++" "make" "cmake" "ninja")
            echo -e "${GREEN}✓ Compiladores adicionados à seleção${NC}"
            ;;
        2)
            SELECTED_PROGRAMS+=("java")
            echo -e "${GREEN}✓ Java adicionado à seleção${NC}"
            ;;
        3)
            SELECTED_PROGRAMS+=("nodejs")
            echo -e "${GREEN}✓ Node.js adicionado à seleção${NC}"
            ;;
        4)
            SELECTED_PROGRAMS+=("git")
            echo -e "${GREEN}✓ Git adicionado à seleção${NC}"
            ;;
        5)
            SELECTED_PROGRAMS+=("vscode")
            echo -e "${GREEN}✓ VSCode adicionado à seleção${NC}"
            ;;
        6)
            SELECTED_PROGRAMS+=("cursor")
            echo -e "${GREEN}✓ Cursor adicionado à seleção${NC}"
            ;;
        7)
            SELECTED_PROGRAMS+=("chrome")
            echo -e "${GREEN}✓ Google Chrome adicionado à seleção${NC}"
            ;;
        8)
            SELECTED_PROGRAMS+=("brave")
            echo -e "${GREEN}✓ Brave Browser adicionado à seleção${NC}"
            ;;
        9)
            SELECTED_PROGRAMS+=("firefox")
            echo -e "${GREEN}✓ Firefox adicionado à seleção${NC}"
            ;;
        10)
            SELECTED_PROGRAMS+=("spotify")
            echo -e "${GREEN}✓ Spotify adicionado à seleção${NC}"
            ;;
        11)
            SELECTED_PROGRAMS+=("osu")
            echo -e "${GREEN}✓ Osu! adicionado à seleção${NC}"
            ;;
        12)
            SELECTED_PROGRAMS+=("anydesk")
            echo -e "${GREEN}✓ AnyDesk adicionado à seleção${NC}"
            ;;
        13)
            SELECTED_PROGRAMS+=("huion")
            echo -e "${GREEN}✓ Driver Huion adicionado à seleção${NC}"
            ;;
        14)
            SELECTED_PROGRAMS=("gcc" "g++" "make" "cmake" "ninja" "java" "nodejs" "git" "vscode" "cursor" "chrome" "brave" "firefox" "spotify" "osu" "anydesk" "huion")
            echo -e "${GREEN}✓ Todos os programas adicionados à seleção${NC}"
            ;;
        15)
            install_selected
            ;;
        16)
            show_selection
            ;;
        17)
            SELECTED_PROGRAMS=()
            echo -e "${YELLOW}✓ Seleção limpa${NC}"
            ;;
        18)
            echo -e "${BLUE}👋 Saindo...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Opção inválida!${NC}"
            ;;
    esac
}

# Função para mostrar seleção atual
show_selection() {
    echo ""
    echo -e "${BLUE}📋 Seleção atual:${NC}"
    if [ ${#SELECTED_PROGRAMS[@]} -eq 0 ]; then
        echo -e "${YELLOW}  Nenhum programa selecionado${NC}"
    else
        for program in "${SELECTED_PROGRAMS[@]}"; do
            echo -e "${GREEN}  ✓ $program${NC}"
        done
    fi
    echo ""
}

# Função para instalar programas selecionados
install_selected() {
    if [ ${#SELECTED_PROGRAMS[@]} -eq 0 ]; then
        echo -e "${YELLOW}⚠️  Nenhum programa selecionado!${NC}"
        return
    fi
    
    echo -e "${BLUE}🚀 Iniciando instalação dos programas selecionados...${NC}"
    echo ""
    
    # Criar arquivo de configuração temporário
    create_temp_config
    
    # Executar script apropriado
    case $DISTRO in
        "opensuse"|"opensuse-leap"|"opensuse-tumbleweed")
            echo -e "${BLUE}🎯 Executando script para openSUSE...${NC}"
            if [ -f "opensuse/install-programs.sh" ]; then
                chmod +x opensuse/install-programs.sh
                ./opensuse/install-programs.sh
            else
                echo -e "${RED}❌ Script do openSUSE não encontrado!${NC}"
            fi
            ;;
        "debian"|"ubuntu"|"linuxmint"|"pop"|"elementary"|"zorin"|"kali")
            echo -e "${BLUE}🎯 Executando script para Debian/Ubuntu...${NC}"
            if [ -f "debian/install-programs-debian.sh" ]; then
                chmod +x debian/install-programs-debian.sh
                ./debian/install-programs-debian.sh
            else
                echo -e "${RED}❌ Script do Debian/Ubuntu não encontrado!${NC}"
            fi
            ;;
        *)
            echo -e "${RED}❌ Distribuição não suportada: $DISTRO${NC}"
            ;;
    esac
}

# Função para criar arquivo de configuração temporário
create_temp_config() {
    echo -e "${YELLOW}📝 Criando arquivo de configuração temporário...${NC}"
    
    cat > "$TEMP_CONFIG" << EOF
# Configuração temporária gerada pela GUI
INSTALL_MODE="custom"
CREATE_BACKUP=true
CLEAN_CACHE=true
INSTALL_DEV_DEPS=true

# Programas selecionados
EOF
    
    for program in "${SELECTED_PROGRAMS[@]}"; do
        case $program in
            "gcc"|"g++"|"make"|"cmake"|"ninja")
                echo "INSTALL_GCC=true" >> "$TEMP_CONFIG"
                ;;
            "java")
                echo "INSTALL_JAVA=true" >> "$TEMP_CONFIG"
                ;;
            "nodejs")
                echo "INSTALL_NODEJS=true" >> "$TEMP_CONFIG"
                ;;
            "git")
                echo "INSTALL_GIT=true" >> "$TEMP_CONFIG"
                ;;
            "vscode")
                echo "INSTALL_VSCODE=true" >> "$TEMP_CONFIG"
                ;;
            "cursor")
                echo "INSTALL_CURSOR=true" >> "$TEMP_CONFIG"
                ;;
            "chrome")
                echo "INSTALL_CHROME=true" >> "$TEMP_CONFIG"
                ;;
            "brave")
                echo "INSTALL_BRAVE=true" >> "$TEMP_CONFIG"
                ;;
            "firefox")
                echo "INSTALL_FIREFOX=true" >> "$TEMP_CONFIG"
                ;;
            "spotify")
                echo "INSTALL_SPOTIFY=true" >> "$TEMP_CONFIG"
                ;;
            "osu")
                echo "INSTALL_OSU=true" >> "$TEMP_CONFIG"
                ;;
            "anydesk")
                echo "INSTALL_ANYDESK=true" >> "$TEMP_CONFIG"
                ;;
            "huion")
                echo "INSTALL_HUION_DRIVER=true" >> "$TEMP_CONFIG"
                ;;
        esac
    done
    
    echo -e "${GREEN}✓ Arquivo de configuração criado: $TEMP_CONFIG${NC}"
}

# Função para exibir resumo
show_summary() {
    echo ""
    echo -e "${GREEN}✅ Instalação concluída!${NC}"
    echo ""
    echo -e "${BLUE}📋 Programas instalados:${NC}"
    for program in "${SELECTED_PROGRAMS[@]}"; do
        echo -e "${GREEN}  ✓ $program${NC}"
    done
    echo ""
    echo -e "${YELLOW}💡 Para desinstalar, execute: ./uninstall.sh${NC}"
    echo ""
}

# Função principal
main() {
    show_header
    detect_distribution
    
    while true; do
        show_main_menu
        show_selection
        
        echo -e "${YELLOW}Digite sua escolha (1-18): ${NC}"
        read -n 1 choice
        echo ""
        
        process_selection $choice
        
        if [ $choice -eq 15 ]; then
            show_summary
            break
        fi
        
        echo ""
        echo -e "${BLUE}Pressione Enter para continuar...${NC}"
        read
        show_header
        detect_distribution
    done
}

# Executar função principal
main
