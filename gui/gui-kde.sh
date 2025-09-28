#!/bin/bash

# Interface Gráfica para KDE usando kdialog
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}🖥️ Linux Install Scripts - Interface KDE${NC}"
echo "============================================="

# Verificar se kdialog está disponível
if ! command -v kdialog &> /dev/null; then
    echo -e "${YELLOW}⚠️ kdialog não encontrado. Tentando instalar...${NC}"
    if command -v zypper &> /dev/null; then
        sudo zypper install -y kdialog
    elif command -v apt &> /dev/null; then
        sudo apt install -y kdialog
    else
        echo -e "${RED}❌ Não foi possível instalar kdialog${NC}"
        exit 1
    fi
fi

# Função para mostrar menu principal
show_main_menu() {
    local choice=$(kdialog --title "Linux Install Scripts" \
        --menu "Selecione uma opção:" \
        "1" "🚀 Instalação Automática" \
        "2" "📋 Listar Programas" \
        "3" "🗑️ Desinstalar Programas" \
        "4" "💾 Backup/Restore" \
        "5" "📊 Estatísticas" \
        "6" "❓ Ajuda" \
        "7" "🚪 Sair")
    
    echo "$choice"
}

# Função para instalação automática
install_programs() {
    if kdialog --title "Instalação Automática" \
        --yesno "Deseja executar a instalação automática de todos os programas?\n\nIsso instalará:\n• Navegadores (Chrome, Brave, Firefox)\n• Editores (VSCode, Cursor)\n• Ferramentas (AnyDesk, Spotify)\n• Desenvolvimento (Java, Node.js)\n• Jogos (Osu!)"; then
        
        kdialog --title "Executando Instalação" \
            --msgbox "Executando instalação automática...\n\nPor favor, aguarde enquanto os programas são instalados."
        
        # Executar instalação
        ./auto-install.sh
        
        kdialog --title "Instalação Concluída" \
            --msgbox "✅ Instalação concluída com sucesso!\n\nTodos os programas foram instalados."
    fi
}

# Função para listar programas
list_programs() {
    local programs="📋 Programas Disponíveis:\n\n"
    programs+="🔧 Desenvolvimento:\n"
    programs+="• VSCode - Editor de código\n"
    programs+="• Cursor - Editor com IA\n"
    programs+="• Java (OpenJDK) - Linguagem de programação\n"
    programs+="• Node.js - Runtime JavaScript\n"
    programs+="• Compiladores (GCC, G++, Make, CMake)\n\n"
    programs+="🌐 Navegadores:\n"
    programs+="• Google Chrome\n"
    programs+="• Brave Browser\n"
    programs+="• Firefox\n\n"
    programs+="🎵 Multimídia:\n"
    programs+="• Spotify - Streaming de música\n"
    programs+="• Osu! - Jogo de ritmo\n\n"
    programs+="🛠️ Ferramentas:\n"
    programs+="• AnyDesk - Acesso remoto\n"
    programs+="• Dependências de desenvolvimento"
    
    kdialog --title "Programas Disponíveis" \
        --msgbox "$programs"
}

# Função para desinstalar programas
uninstall_programs() {
    if kdialog --title "Desinstalar Programas" \
        --yesno "Deseja executar o script de desinstalação?\n\nIsso removerá todos os programas instalados pelo script."; then
        
        kdialog --title "Desinstalação" \
            --msgbox "Executando script de desinstalação..."
        
        # Executar script de desinstalação
        ./uninstall.sh
        
        kdialog --title "Desinstalação Concluída" \
            --msgbox "✅ Desinstalação concluída com sucesso!"
    fi
}

# Função para backup
backup_menu() {
    local backup_choice=$(kdialog --title "Backup/Restore" \
        --menu "Selecione uma opção de backup:" \
        "1" "💾 Criar Backup" \
        "2" "📋 Listar Backups" \
        "3" "📊 Estatísticas")
    
    case "$backup_choice" in
        "1")
            kdialog --title "Criando Backup" \
                --msgbox "Criando backup do sistema..."
            ./backup/backup.sh create
            kdialog --title "Backup Concluído" \
                --msgbox "✅ Backup criado com sucesso!"
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
    local stats="📊 Estatísticas do Sistema\n\n"
    stats+="🖥️ Sistema:\n"
    if command -v lsb_release &> /dev/null; then
        stats+="• Distribuição: $(lsb_release -d | cut -f2)\n"
    else
        stats+="• Sistema: $(uname -s) $(uname -r)\n"
    fi
    stats+="• Kernel: $(uname -r)\n"
    stats+="• Usuário: $USER\n\n"
    stats+="💾 Espaço em Disco:\n"
    stats+="• $(df -h / | tail -1 | awk '{print $4}') disponível\n\n"
    stats+="🧠 Memória:\n"
    stats+="• $(free -h | grep Mem | awk '{print $7}') disponível"
    
    kdialog --title "Estatísticas do Sistema" \
        --msgbox "$stats"
}

# Função para mostrar ajuda
show_help() {
    local help_text="❓ Ajuda - Linux Install Scripts\n\n"
    help_text+="🚀 Instalação Automática:\n"
    help_text+="Selecione a opção 1 para instalar todos os programas.\n\n"
    help_text+="📋 Listar Programas:\n"
    help_text+="Veja todos os programas disponíveis para instalação.\n\n"
    help_text+="🗑️ Desinstalar:\n"
    help_text+="Remove todos os programas instalados pelo script.\n\n"
    help_text+="💾 Backup:\n"
    help_text+="Crie backups antes de grandes mudanças.\n\n"
    help_text+="📊 Estatísticas:\n"
    help_text+="Veja informações do sistema e programas instalados.\n\n"
    help_text+="🔗 Suporte:\n"
    help_text+="• Repositório: https://github.com/xJCPMSx/linux-install-scripts\n"
    help_text+="• Issues: https://github.com/xJCPMSx/linux-install-scripts/issues\n"
    help_text+="• Documentação: README.md"
    
    kdialog --title "Ajuda" \
        --msgbox "$help_text"
}

# Função principal
main() {
    # Verificar se está sendo executado em modo gráfico
    if [ -z "$DISPLAY" ]; then
        echo -e "${RED}❌ Erro: Interface gráfica não disponível${NC}"
        echo "Execute em um ambiente gráfico ou use os scripts de linha de comando"
        exit 1
    fi
    
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
                kdialog --title "Saindo" \
                    --msgbox "Obrigado por usar Linux Install Scripts!"
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
