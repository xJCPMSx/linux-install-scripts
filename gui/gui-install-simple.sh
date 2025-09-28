#!/bin/bash

# Interface Gráfica Simplificada para Linux Install Scripts
# Versão: 1.0-beta
# Data: 2025-09-28

# Suprimir warnings do GTK/Zenity
export GTK_IM_MODULE=""
export QT_IM_MODULE=""
export XMODIFIERS=""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Função para executar zenity com supressão de warnings
run_zenity() {
    zenity "$@" 2>/dev/null
}

# Função para mostrar menu principal
show_main_menu() {
    local choice=$(run_zenity --list \
        --title="Linux Install Scripts" \
        --text="Selecione uma opção:" \
        --column="Opção" \
        --column="Descrição" \
        "1" "🚀 Instalação Automática" \
        "2" "📋 Listar Programas" \
        "3" "🗑️ Desinstalar Programas" \
        "4" "💾 Backup/Restore" \
        "5" "📊 Estatísticas" \
        "6" "❓ Ajuda" \
        "7" "🚪 Sair" \
        --width=600 \
        --height=400)
    
    echo "$choice"
}

# Função para instalação automática
install_programs() {
    run_zenity --question \
        --title="Instalação Automática" \
        --text="Deseja executar a instalação automática de todos os programas?\n\nIsso instalará:\n• Navegadores (Chrome, Brave, Firefox)\n• Editores (VSCode, Cursor)\n• Ferramentas (AnyDesk, Spotify)\n• Desenvolvimento (Java, Node.js)\n• Jogos (Osu!)" \
        --width=500 \
        --height=300
    
    if [ $? -eq 0 ]; then
        run_zenity --info \
            --title="Executando Instalação" \
            --text="Executando instalação automática...\n\nPor favor, aguarde enquanto os programas são instalados." \
            --width=400 \
            --height=200 &
        
        # Executar instalação em background
        ./auto-install.sh
        
        run_zenity --info \
            --title="Instalação Concluída" \
            --text="✅ Instalação concluída com sucesso!\n\nTodos os programas foram instalados." \
            --width=400 \
            --height=200
    fi
}

# Função para listar programas
list_programs() {
    local programs="<b>📋 Programas Disponíveis:</b>\n\n"
    programs+="<b>🔧 Desenvolvimento:</b>\n"
    programs+="• VSCode - Editor de código\n"
    programs+="• Cursor - Editor com IA\n"
    programs+="• Java (OpenJDK) - Linguagem de programação\n"
    programs+="• Node.js - Runtime JavaScript\n"
    programs+="• Compiladores (GCC, G++, Make, CMake)\n\n"
    programs+="<b>🌐 Navegadores:</b>\n"
    programs+="• Google Chrome\n"
    programs+="• Brave Browser\n"
    programs+="• Firefox\n\n"
    programs+="<b>🎵 Multimídia:</b>\n"
    programs+="• Spotify - Streaming de música\n"
    programs+="• Osu! - Jogo de ritmo\n\n"
    programs+="<b>🛠️ Ferramentas:</b>\n"
    programs+="• AnyDesk - Acesso remoto\n"
    programs+="• Dependências de desenvolvimento\n"
    
    run_zenity --info \
        --title="Programas Disponíveis" \
        --text="$programs" \
        --width=600 \
        --height=500
}

# Função para desinstalar programas
uninstall_programs() {
    run_zenity --question \
        --title="Desinstalar Programas" \
        --text="Deseja executar o script de desinstalação?\n\nIsso removerá todos os programas instalados pelo script." \
        --width=400 \
        --height=200
    
    if [ $? -eq 0 ]; then
        run_zenity --info \
            --title="Desinstalação" \
            --text="Executando script de desinstalação..." \
            --width=400 \
            --height=200 &
        
        # Executar script de desinstalação
        ./uninstall.sh
        
        run_zenity --info \
            --title="Desinstalação Concluída" \
            --text="✅ Desinstalação concluída com sucesso!" \
            --width=400 \
            --height=200
    fi
}

# Função para backup
backup_menu() {
    local backup_choice=$(run_zenity --list \
        --title="Backup/Restore" \
        --text="Selecione uma opção de backup:" \
        --column="Opção" \
        --column="Descrição" \
        "1" "💾 Criar Backup" \
        "2" "📋 Listar Backups" \
        "3" "📊 Estatísticas" \
        --width=500 \
        --height=300)
    
    case "$backup_choice" in
        "1")
            run_zenity --info \
                --title="Criando Backup" \
                --text="Criando backup do sistema..." \
                --width=400 \
                --height=200 &
            ./backup/backup.sh create
            run_zenity --info \
                --title="Backup Concluído" \
                --text="✅ Backup criado com sucesso!" \
                --width=400 \
                --height=200
            ;;
        "2")
            ./backup/backup.sh list
            ;;
        "3")
            ./backup/backup.sh stats
            ;;
    esac
}

# Função para mostrar estatísticas
show_statistics() {
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
    stats+="• $(free -h | grep Mem | awk '{print $7}') disponível\n\n"
    stats+="<b>📦 Programas Instalados:</b>\n"
    if command -v zypper &> /dev/null; then
        stats+="• $(zypper packages --installed-only | wc -l) pacotes (Zypper)\n"
    fi
    if command -v flatpak &> /dev/null; then
        stats+="• $(flatpak list | wc -l) aplicativos (Flatpak)\n"
    fi
    
    run_zenity --info \
        --title="Estatísticas do Sistema" \
        --text="$stats" \
        --width=600 \
        --height=500
}

# Função para mostrar ajuda
show_help() {
    local help_text="<b>❓ Ajuda - Linux Install Scripts</b>\n\n"
    help_text+="<b>🚀 Instalação Automática:</b>\n"
    help_text+="Selecione a opção 1 para instalar todos os programas.\n\n"
    help_text+="<b>📋 Listar Programas:</b>\n"
    help_text+="Veja todos os programas disponíveis para instalação.\n\n"
    help_text+="<b>🗑️ Desinstalar:</b>\n"
    help_text+="Remove todos os programas instalados pelo script.\n\n"
    help_text+="<b>💾 Backup:</b>\n"
    help_text+="Crie backups antes de grandes mudanças.\n\n"
    help_text+="<b>📊 Estatísticas:</b>\n"
    help_text+="Veja informações do sistema e programas instalados.\n\n"
    help_text+="<b>🔗 Suporte:</b>\n"
    help_text+="• Repositório: https://github.com/xJCPMSx/linux-install-scripts\n"
    help_text+="• Issues: https://github.com/xJCPMSx/linux-install-scripts/issues\n"
    help_text+="• Documentação: README.md"
    
    run_zenity --info \
        --title="Ajuda" \
        --text="$help_text" \
        --width=700 \
        --height=600
}

# Função principal
main() {
    # Verificar se está sendo executado em modo gráfico
    if [ -z "$DISPLAY" ]; then
        echo "❌ Erro: Interface gráfica não disponível"
        echo "Execute em um ambiente gráfico ou use os scripts de linha de comando"
        exit 1
    fi
    
    echo -e "${BLUE}🖥️ Linux Install Scripts - Interface Gráfica${NC}"
    echo "============================================="
    
    while true; do
        local choice=$(show_main_menu)
        
        case "$choice" in
            "1")
                install_programs
                ;;
            "2")
                list_programs
                ;;
            "3")
                uninstall_programs
                ;;
            "4")
                backup_menu
                ;;
            "5")
                show_statistics
                ;;
            "6")
                show_help
                ;;
            "7")
                run_zenity --info \
                    --title="Saindo" \
                    --text="Obrigado por usar Linux Install Scripts!" \
                    --width=400 \
                    --height=200
                exit 0
                ;;
            *)
                exit 0
                ;;
        esac
    done
}

# Executar função principal
main "$@"
