#!/bin/bash

# Interface Gráfica Simplificada para Linux Install Scripts
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

# Configurar variáveis de ambiente para corrigir transparência
setup_environment() {
    export GTK_THEME="Adwaita"
    export GTK_CSD="0"
    export GDK_BACKEND="x11"
    export GTK_IM_MODULE=""
    export QT_IM_MODULE=""
    export XMODIFIERS=""
    
    if [ -n "$KDE_FULL_SESSION" ] || [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
        export QT_QPA_PLATFORM="xcb"
        export QT_AUTO_SCREEN_SCALE_FACTOR="1"
        export QT_SCALE_FACTOR="1"
    fi
}

# Função para executar zenity
run_zenity() {
    local args=("$@")
    
    if [[ "${args[0]}" == "--info" ]]; then
        zenity "${args[@]}" --no-wrap --width=500 --height=300 2>/dev/null
    elif [[ "${args[0]}" == "--list" ]]; then
        zenity "${args[@]}" --no-wrap --width=600 --height=400 2>/dev/null
    elif [[ "${args[0]}" == "--question" ]]; then
        zenity "${args[@]}" --no-wrap --width=500 --height=300 2>/dev/null
    else
        zenity "${args[@]}" 2>/dev/null
    fi
}

# Função para executar kdialog
run_kdialog() {
    kdialog "$@"
}

# Detectar ferramenta GUI
detect_gui_tool() {
    if command -v kdialog &> /dev/null && ([ -n "$KDE_FULL_SESSION" ] || [ "$XDG_CURRENT_DESKTOP" = "KDE" ]); then
        echo "kdialog"
    elif command -v zenity &> /dev/null; then
        echo "zenity"
    else
        echo "none"
    fi
}

# Instalar zenity se necessário
install_zenity() {
    echo -e "${YELLOW}⚠️ Zenity não encontrado. Instalando...${NC}"
    if command -v zypper &> /dev/null; then
        sudo zypper install -y zenity
    elif command -v apt &> /dev/null; then
        sudo apt install -y zenity
    else
        echo -e "${RED}❌ Não foi possível instalar zenity automaticamente${NC}"
        return 1
    fi
}

# Menu principal
show_main_menu() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local choice=$(run_kdialog --title "Linux Install Scripts" \
            --menu "Selecione uma opção:" \
            "1" "🚀 Instalação Automática" \
            "2" "📋 Listar Programas" \
            "3" "🗑️ Desinstalar Programas" \
            "4" "📊 Estatísticas" \
            "5" "❓ Ajuda" \
            "6" "🚪 Sair")
    else
        local choice=$(run_zenity --list \
            --title="Linux Install Scripts" \
            --text="Selecione uma opção:" \
            --column="Opção" \
            --column="Descrição" \
            "1" "🚀 Instalação Automática" \
            "2" "📋 Listar Programas" \
            "3" "🗑️ Desinstalar Programas" \
            "4" "📊 Estatísticas" \
            "5" "❓ Ajuda" \
            "6" "🚪 Sair")
    fi
    
    echo "$choice"
}

# Instalação automática
install_programs() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        if run_kdialog --title "Instalação Automática" \
            --yesno "Deseja executar a instalação automática de todos os programas?"; then
            
            run_kdialog --title "Executando Instalação" \
                --msgbox "Executando instalação automática..."
            
            ./auto-install.sh
            
            run_kdialog --title "Instalação Concluída" \
                --msgbox "✅ Instalação concluída com sucesso!"
        fi
    else
        if run_zenity --question \
            --title="Instalação Automática" \
            --text="Deseja executar a instalação automática de todos os programas?"; then
            
            run_zenity --info \
                --title="Executando Instalação" \
                --text="Executando instalação automática..."
            
            ./auto-install.sh
            
            run_zenity --info \
                --title="Instalação Concluída" \
                --text="✅ Instalação concluída com sucesso!"
        fi
    fi
}

# Listar programas
list_programs() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local programs="📋 PROGRAMAS DISPONÍVEIS\n\n"
        programs+="🔧 DESENVOLVIMENTO:\n"
        programs+="• VSCode - Editor de código\n"
        programs+="• Cursor - Editor com IA\n"
        programs+="• Java (OpenJDK)\n"
        programs+="• Node.js\n"
        programs+="• Compiladores (GCC, G++, Make, CMake)\n\n"
        programs+="🌐 NAVEGADORES:\n"
        programs+="• Google Chrome\n"
        programs+="• Brave Browser\n"
        programs+="• Firefox\n\n"
        programs+="🎵 MULTIMÍDIA:\n"
        programs+="• Spotify\n"
        programs+="• Osu!\n\n"
        programs+="🛠️ FERRAMENTAS:\n"
        programs+="• AnyDesk\n"
        programs+="• Dependências de desenvolvimento"
        
        run_kdialog --title "Programas Disponíveis" \
            --msgbox "$programs" \
            --geometry 600x500
    else
        local programs="<b>📋 Programas Disponíveis</b>\n\n"
        programs+="<b>🔧 Desenvolvimento:</b>\n"
        programs+="• VSCode - Editor de código\n"
        programs+="• Cursor - Editor com IA\n"
        programs+="• Java (OpenJDK)\n"
        programs+="• Node.js\n"
        programs+="• Compiladores (GCC, G++, Make, CMake)\n\n"
        programs+="<b>🌐 Navegadores:</b>\n"
        programs+="• Google Chrome\n"
        programs+="• Brave Browser\n"
        programs+="• Firefox\n\n"
        programs+="<b>🎵 Multimídia:</b>\n"
        programs+="• Spotify\n"
        programs+="• Osu!\n\n"
        programs+="<b>🛠️ Ferramentas:</b>\n"
        programs+="• AnyDesk\n"
        programs+="• Dependências de desenvolvimento"
        
        run_zenity --info \
            --title="Programas Disponíveis" \
            --text="$programs" \
            --width=700 \
            --height=600
    fi
}

# Desinstalar programas
uninstall_programs() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        if run_kdialog --title "Desinstalar Programas" \
            --yesno "Deseja executar o script de desinstalação?"; then
            
            run_kdialog --title "Desinstalação" \
                --msgbox "Executando script de desinstalação..."
            
            ./uninstall.sh
            
            run_kdialog --title "Desinstalação Concluída" \
                --msgbox "✅ Desinstalação concluída com sucesso!"
        fi
    else
        if run_zenity --question \
            --title="Desinstalar Programas" \
            --text="Deseja executar o script de desinstalação?"; then
            
            run_zenity --info \
                --title="Desinstalação" \
                --text="Executando script de desinstalação..."
            
            ./uninstall.sh
            
            run_zenity --info \
                --title="Desinstalação Concluída" \
                --text="✅ Desinstalação concluída com sucesso!"
        fi
    fi
}

# Estatísticas
show_statistics() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local stats="📊 ESTATÍSTICAS DO SISTEMA\n\n"
        stats+="🖥️ SISTEMA:\n"
        if command -v lsb_release &> /dev/null; then
            stats+="• Distribuição: $(lsb_release -d | cut -f2)\n"
        else
            stats+="• Sistema: $(uname -s) $(uname -r)\n"
        fi
        stats+="• Kernel: $(uname -r)\n"
        stats+="• Usuário: $USER\n\n"
        stats+="💾 ESPAÇO EM DISCO:\n"
        stats+="• $(df -h / | tail -1 | awk '{print $4}') disponível\n\n"
        stats+="🧠 MEMÓRIA:\n"
        stats+="• $(free -h | grep Mem | awk '{print $7}') disponível"
        
        run_kdialog --title "Estatísticas do Sistema" \
            --msgbox "$stats" \
            --geometry 600x500
    else
        local stats="<b>📊 Estatísticas do Sistema</b>\n\n"
        stats+="<b>🖥️ Sistema:</b>\n"
        if command -v lsb_release &> /dev/null; then
            stats+="• Distribuição: $(lsb_release -d | cut -f2)\n"
        else
            stats+="• Sistema: $(uname -s) $(uname -r)\n"
        fi
        stats+="• Kernel: $(uname -r)\n"
        stats+="• Usuário: $USER\n\n"
        stats+="<b>💾 Espaço em Disco:</b>\n"
        stats+="• $(df -h / | tail -1 | awk '{print $4}') disponível\n\n"
        stats+="<b>🧠 Memória:</b>\n"
        stats+="• $(free -h | grep Mem | awk '{print $7}') disponível"
        
        run_zenity --info \
            --title="Estatísticas do Sistema" \
            --text="$stats" \
            --width=700 \
            --height=600
    fi
}

# Ajuda
show_help() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local help_text="❓ AJUDA - LINUX INSTALL SCRIPTS\n\n"
        help_text+="🚀 INSTALAÇÃO AUTOMÁTICA:\n"
        help_text+="Selecione a opção 1 para instalar todos os programas.\n\n"
        help_text+="📋 LISTAR PROGRAMAS:\n"
        help_text+="Veja todos os programas disponíveis.\n\n"
        help_text+="🗑️ DESINSTALAR:\n"
        help_text+="Remove todos os programas instalados.\n\n"
        help_text+="📊 ESTATÍSTICAS:\n"
        help_text+="Veja informações do sistema.\n\n"
        help_text+="🔗 SUPORTE:\n"
        help_text+="• Repositório: https://github.com/xJCPMSx/linux-install-scripts"
        
        run_kdialog --title "Ajuda" \
            --msgbox "$help_text" \
            --geometry 700x600
    else
        local help_text="<b>❓ Ajuda - Linux Install Scripts</b>\n\n"
        help_text+="<b>🚀 Instalação Automática:</b>\n"
        help_text+="Selecione a opção 1 para instalar todos os programas.\n\n"
        help_text+="<b>📋 Listar Programas:</b>\n"
        help_text+="Veja todos os programas disponíveis.\n\n"
        help_text+="<b>🗑️ Desinstalar:</b>\n"
        help_text+="Remove todos os programas instalados.\n\n"
        help_text+="<b>📊 Estatísticas:</b>\n"
        help_text+="Veja informações do sistema.\n\n"
        help_text+="<b>🔗 Suporte:</b>\n"
        help_text+="• Repositório: https://github.com/xJCPMSx/linux-install-scripts"
        
        run_zenity --info \
            --title="Ajuda" \
            --text="$help_text" \
            --width=800 \
            --height=700
    fi
}

# Função principal
main() {
    if [ -z "$DISPLAY" ]; then
        echo -e "${RED}❌ Erro: Interface gráfica não disponível${NC}"
        echo "Execute em um ambiente gráfico ou use os scripts de linha de comando:"
        echo "  ./auto-install.sh    - Instalação automática"
        echo "  ./uninstall.sh       - Desinstalação"
        exit 1
    fi
    
    setup_environment
    
    local gui_tool=$(detect_gui_tool)
    
    if [ "$gui_tool" = "none" ]; then
        echo -e "${YELLOW}⚠️ Nenhuma ferramenta GUI encontrada. Tentando instalar zenity...${NC}"
        if install_zenity; then
            gui_tool="zenity"
        else
            echo -e "${RED}❌ Não foi possível instalar ferramenta GUI${NC}"
            exit 1
        fi
    fi
    
    echo -e "${GREEN}✅ Usando $gui_tool para interface gráfica${NC}"
    
    while true; do
        local choice=$(show_main_menu "$gui_tool")
        
        case "$choice" in
            "1") install_programs "$gui_tool" ;;
            "2") list_programs "$gui_tool" ;;
            "3") uninstall_programs "$gui_tool" ;;
            "4") show_statistics "$gui_tool" ;;
            "5") show_help "$gui_tool" ;;
            "6")
                if [ "$gui_tool" = "kdialog" ]; then
                    run_kdialog --title "Saindo" \
                        --msgbox "Obrigado por usar Linux Install Scripts!"
                else
                    run_zenity --info \
                        --title="Saindo" \
                        --text="Obrigado por usar Linux Install Scripts!"
                fi
                exit 0
                ;;
            *) exit 0 ;;
        esac
    done
}

main "$@"
