#!/bin/bash

# Interface Gráfica Unificada para Linux Install Scripts
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🖥️ Instalador Gráfico - v1.1-stable${NC}"
echo "============================================="

# Configurar variáveis de ambiente para corrigir transparência
setup_environment() {
    # Configurações para corrigir transparência
    export GTK_THEME="Adwaita"
    export GTK_CSD="0"
    export GDK_BACKEND="x11"
    export GTK_IM_MODULE=""
    export QT_IM_MODULE=""
    export XMODIFIERS=""
    
    # Configurações específicas para KDE
    if [ -n "$KDE_FULL_SESSION" ] || [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
        export QT_QPA_PLATFORM="xcb"
        export QT_AUTO_SCREEN_SCALE_FACTOR="1"
        export QT_SCALE_FACTOR="1"
    fi
}

# Função para executar zenity com supressão de warnings
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

# Função para executar kdialog (alternativa para KDE)
run_kdialog() {
    kdialog "$@"
}

# Detectar ferramenta GUI disponível
detect_gui_tool() {
    if command -v kdialog &> /dev/null && { [ -n "$KDE_FULL_SESSION" ] || [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; }; then
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

# Função para mostrar menu principal
show_main_menu() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local choice
        choice=$(run_kdialog --title "Linux Install Scripts" \
            --menu "Selecione uma opção:" \
            "1" "🚀 Instalação Automática" \
            "2" "📋 Listar Programas" \
            "3" "🗑️ Desinstalar Programas" \
            "4" "💾 Backup/Restore" \
            "5" "📊 Estatísticas" \
            "6" "❓ Ajuda" \
            "7" "🚪 Sair")
    else
        local choice
        choice=$(run_zenity --list \
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
            "7" "🚪 Sair")
    fi
    
    echo "$choice"
}

# Função para instalação automática
install_programs() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        if run_kdialog --title "Instalação Automática" \
            --yesno "Deseja executar a instalação automática de todos os programas?\n\nIsso instalará:\n• Navegadores (Chrome, Brave, Firefox)\n• Editores (VSCode, Cursor)\n• Ferramentas (AnyDesk, Spotify)\n• Desenvolvimento (Java, Node.js)\n• Jogos (Osu!)"; then
            
            run_kdialog --title "Executando Instalação" \
                --msgbox "Executando instalação automática...\n\nPor favor, aguarde enquanto os programas são instalados."
            
            ./auto-install.sh
            
            run_kdialog --title "Instalação Concluída" \
                --msgbox "✅ Instalação concluída com sucesso!\n\nTodos os programas foram instalados."
        fi
    else
        if run_zenity --question \
            --title="Instalação Automática" \
            --text="Deseja executar a instalação automática de todos os programas?\n\nIsso instalará:\n• Navegadores (Chrome, Brave, Firefox)\n• Editores (VSCode, Cursor)\n• Ferramentas (AnyDesk, Spotify)\n• Desenvolvimento (Java, Node.js)\n• Jogos (Osu!)"; then
            
            run_zenity --info \
                --title="Executando Instalação" \
                --text="Executando instalação automática...\n\nPor favor, aguarde enquanto os programas são instalados."
            
            ./auto-install.sh
            
            run_zenity --info \
                --title="Instalação Concluída" \
                --text="✅ Instalação concluída com sucesso!\n\nTodos os programas foram instalados."
        fi
    fi
}

# Função para listar programas
list_programs() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local programs="📋 PROGRAMAS DISPONÍVEIS\n\n"
        programs+="🔧 DESENVOLVIMENTO:\n"
        programs+="• VSCode - Editor de código\n"
        programs+="• Cursor - Editor com IA\n"
        programs+="• Java (OpenJDK) - Linguagem de programação\n"
        programs+="• Node.js - Runtime JavaScript\n"
        programs+="• Compiladores (GCC, G++, Make, CMake)\n\n"
        programs+="🤖 FERRAMENTAS DE IA:\n"
        programs+="• Claude Code - Assistente de programação\n"
        programs+="• Antigravity - Ferramenta de OSINT\n"
        programs+="• Cursor - Editor com IA integrada\n\n"
        programs+="🌐 NAVEGADORES:\n"
        programs+="• Google Chrome\n"
        programs+="• Brave Browser\n"
        programs+="• Firefox\n\n"
        programs+="🎵 MULTIMÍDIA:\n"
        programs+="• Spotify - Streaming de música\n"
        programs+="• Osu! - Jogo de ritmo\n\n"
        programs+="🛠️ FERRAMENTAS:\n"
        programs+="• AnyDesk - Acesso remoto\n"
        programs+="• Docker e Docker Compose\n"
        programs+="• yt-dlp - Download de vídeos\n"
        programs+="• WireGuard - VPN\n"
        programs+="• Dependências de desenvolvimento\n\n"
        programs+="🔍 FERRAMENTAS OSINT:\n"
        programs+="• Sherlock - Busca de username\n"
        programs+="• theHarvester - Coleta de emails\n"
        programs+="• Recon-ng - Framework de reconhecimento\n"
        programs+="• SpiderFoot - Automação OSINT\n"
        programs+="• GHunt - OSINT de contas Google\n"
        programs+="• PhoneInfoga - OSINT de telefones\n"
        programs+="• Maigret - Busca avançada de username\n"
        programs+="• Holehe - Verificação de email em 120+ sites\n\n"
        programs+="🛡️ FERRAMENTAS DE SEGURANÇA:\n"
        programs+="• Nmap - Scanner de rede\n"
        programs+="• Wireshark - Análise de tráfego\n"
        programs+="• John - Quebrador de senhas\n"
        programs+="• Hydra - Ataque de força bruta\n"
        programs+="• Aircrack-ng - Segurança WiFi\n"
        programs+="• Hashcat - Quebrador de hashes\n"
        programs+="• SQLMap - Teste de SQL injection\n"
        programs+="• Nikto - Scanner de vulnerabilidades\n"
        programs+="• Gobuster - Fuzzing de diretórios\n"
        programs+="• ffuf - Fuzzing web\n\n"
        programs+="🎮 PLATAFORMAS DE JOGOS:\n"
        programs+="• Steam - Plataforma de jogos\n"
        programs+="• Lutris - Gerenciador de jogos\n"
        programs+="• Heroic Games Launcher - Epic Games & GOG\n"
        programs+="• WinBoat - Emulador de Windows\n"
        programs+="• Driver Oficial da Huion - Para tablets gráficos"
        
        run_kdialog --title "Programas Disponíveis" \
            --msgbox "$programs" \
            --geometry 600x500
    else
        # Para zenity, usar formato HTML para melhor formatação
        local programs="<b>📋 Programas Disponíveis</b>\n\n"
        programs+="<b>🔧 Desenvolvimento:</b>\n"
        programs+="• VSCode - Editor de código\n"
        programs+="• Cursor - Editor com IA\n"
        programs+="• Java (OpenJDK) - Linguagem de programação\n"
        programs+="• Node.js - Runtime JavaScript\n"
        programs+="• Compiladores (GCC, G++, Make, CMake)\n\n"
        programs+="<b>🤖 Ferramentas de IA:</b>\n"
        programs+="• Claude Code - Assistente de programação\n"
        programs+="• Antigravity - Ferramenta de OSINT\n"
        programs+="• Cursor - Editor com IA integrada\n\n"
        programs+="<b>🌐 Navegadores:</b>\n"
        programs+="• Google Chrome\n"
        programs+="• Brave Browser\n"
        programs+="• Firefox\n\n"
        programs+="<b>🎵 Multimídia:</b>\n"
        programs+="• Spotify - Streaming de música\n"
        programs+="• Osu! - Jogo de ritmo\n\n"
        programs+="<b>🛠️ Ferramentas:</b>\n"
        programs+="• AnyDesk - Acesso remoto\n"
        programs+="• Docker e Docker Compose\n"
        programs+="• yt-dlp - Download de vídeos\n"
        programs+="• WireGuard - VPN\n"
        programs+="• Dependências de desenvolvimento\n\n"
        programs+="<b>🔍 Ferramentas OSINT:</b>\n"
        programs+="• Sherlock - Busca de username\n"
        programs+="• theHarvester - Coleta de emails\n"
        programs+="• Recon-ng - Framework de reconhecimento\n"
        programs+="• SpiderFoot - Automação OSINT\n"
        programs+="• GHunt - OSINT de contas Google\n"
        programs+="• PhoneInfoga - OSINT de telefones\n"
        programs+="• Maigret - Busca avançada de username\n"
        programs+="• Holehe - Verificação de email em 120+ sites\n\n"
        programs+="<b>🛡️ Ferramentas de Segurança:</b>\n"
        programs+="• Nmap - Scanner de rede\n"
        programs+="• Wireshark - Análise de tráfego\n"
        programs+="• John - Quebrador de senhas\n"
        programs+="• Hydra - Ataque de força bruta\n"
        programs+="• Aircrack-ng - Segurança WiFi\n"
        programs+="• Hashcat - Quebrador de hashes\n"
        programs+="• SQLMap - Teste de SQL injection\n"
        programs+="• Nikto - Scanner de vulnerabilidades\n"
        programs+="• Gobuster - Fuzzing de diretórios\n"
        programs+="• ffuf - Fuzzing web\n\n"
        programs+="<b>🎮 Plataformas de Jogos:</b>\n"
        programs+="• Steam - Plataforma de jogos\n"
        programs+="• Lutris - Gerenciador de jogos\n"
        programs+="• Heroic Games Launcher - Epic Games & GOG\n"
        programs+="• WinBoat - Emulador de Windows\n"
        programs+="• Driver Oficial da Huion - Para tablets gráficos"
        
        run_zenity --info \
            --title="Programas Disponíveis" \
            --text="$programs" \
            --width=700 \
            --height=600
    fi
}

# Função para desinstalar programas
uninstall_programs() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        if run_kdialog --title "Desinstalar Programas" \
            --yesno "Deseja executar o script de desinstalação?\n\nIsso removerá todos os programas instalados pelo script."; then
            
            run_kdialog --title "Desinstalação" \
                --msgbox "Executando script de desinstalação..."
            
            ./uninstall.sh
            
            run_kdialog --title "Desinstalação Concluída" \
                --msgbox "✅ Desinstalação concluída com sucesso!"
        fi
    else
        if run_zenity --question \
            --title="Desinstalar Programas" \
            --text="Deseja executar o script de desinstalação?\n\nIsso removerá todos os programas instalados pelo script."; then
            
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

# Função para backup
backup_menu() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local backup_choice
        backup_choice=$(run_kdialog --title "Backup/Restore" \
            --menu "Selecione uma opção de backup:" \
            "1" "💾 Criar Backup" \
            "2" "📋 Listar Backups" \
            "3" "📊 Estatísticas")
    else
        local backup_choice
        backup_choice=$(run_zenity --list \
            --title="Backup/Restore" \
            --text="Selecione uma opção de backup:" \
            --column="Opção" \
            --column="Descrição" \
            "1" "💾 Criar Backup" \
            "2" "📋 Listar Backups" \
            "3" "📊 Estatísticas")
    fi
    
    case "$backup_choice" in
        "1")
            if [ "$gui_tool" = "kdialog" ]; then
                run_kdialog --title "Criando Backup" \
                    --msgbox "Criando backup do sistema..."
            else
                run_zenity --info \
                    --title="Criando Backup" \
                    --text="Criando backup do sistema..."
            fi
            ./backup/backup.sh create
            if [ "$gui_tool" = "kdialog" ]; then
                run_kdialog --title "Backup Concluído" \
                    --msgbox "✅ Backup criado com sucesso!"
            else
                run_zenity --info \
                    --title="Backup Concluído" \
                    --text="✅ Backup criado com sucesso!"
            fi
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
        stats+="• $(free -h | grep Mem | awk '{print $7}') disponível\n\n"
        stats+="📦 PROGRAMAS INSTALADOS:\n"
        if command -v zypper &> /dev/null; then
            stats+="• $(zypper packages --installed-only | wc -l) pacotes (Zypper)\n"
        fi
        if command -v flatpak &> /dev/null; then
            stats+="• $(flatpak list | wc -l) aplicativos (Flatpak)\n"
        fi
        
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
            --width=700 \
            --height=600
    fi
}

# Função para mostrar ajuda
show_help() {
    local gui_tool="$1"
    
    if [ "$gui_tool" = "kdialog" ]; then
        local help_text="❓ AJUDA - LINUX INSTALL SCRIPTS\n\n"
        help_text+="🚀 INSTALAÇÃO AUTOMÁTICA:\n"
        help_text+="Selecione a opção 1 para instalar todos os programas.\n\n"
        help_text+="📋 LISTAR PROGRAMAS:\n"
        help_text+="Veja todos os programas disponíveis para instalação.\n\n"
        help_text+="🗑️ DESINSTALAR:\n"
        help_text+="Remove todos os programas instalados pelo script.\n\n"
        help_text+="💾 BACKUP:\n"
        help_text+="Crie backups antes de grandes mudanças.\n\n"
        help_text+="📊 ESTATÍSTICAS:\n"
        help_text+="Veja informações do sistema e programas instalados.\n\n"
        help_text+="🔗 SUPORTE:\n"
        help_text+="• Repositório: https://github.com/xJCPMSx/linux-install-scripts\n"
        help_text+="• Issues: https://github.com/xJCPMSx/linux-install-scripts/issues\n"
        help_text+="• Documentação: README.md"
        
        run_kdialog --title "Ajuda" \
            --msgbox "$help_text" \
            --geometry 700x600
    else
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
            --width=800 \
            --height=700
    fi
}

# Função principal
main() {
    # Verificar se está em modo gráfico
    if [ -z "$DISPLAY" ]; then
        echo -e "${RED}❌ Erro: Interface gráfica não disponível${NC}"
        echo "Execute em um ambiente gráfico ou use os scripts de linha de comando:"
        echo "  ./auto-install.sh    - Instalação automática"
        echo "  ./uninstall.sh       - Desinstalação"
        exit 1
    fi
    
    # Configurar ambiente
    setup_environment
    
    # Detectar ferramenta GUI
    local gui_tool
    gui_tool=$(detect_gui_tool)
    
    if [ "$gui_tool" = "none" ]; then
        echo -e "${YELLOW}⚠️ Nenhuma ferramenta GUI encontrada. Tentando instalar zenity...${NC}"
        if install_zenity; then
            gui_tool="zenity"
        else
            echo -e "${RED}❌ Não foi possível instalar ferramenta GUI${NC}"
            echo "Por favor, instale zenity ou kdialog manualmente:"
            echo "  openSUSE: sudo zypper install zenity"
            echo "  Debian/Ubuntu: sudo apt install zenity"
            exit 1
        fi
    fi
    
    echo -e "${GREEN}✅ Usando $gui_tool para interface gráfica${NC}"
    
    # Loop principal do menu
    while true; do
        local choice
        choice=$(show_main_menu "$gui_tool")
        
        case "$choice" in
            "1")
                install_programs "$gui_tool"
                ;;
            "2")
                list_programs "$gui_tool"
                ;;
            "3")
                uninstall_programs "$gui_tool"
                ;;
            "4")
                backup_menu "$gui_tool"
                ;;
            "5")
                show_statistics "$gui_tool"
                ;;
            "6")
                show_help "$gui_tool"
                ;;
            "7")
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
            *)
                exit 0
                ;;
        esac
    done
}

# Executar função principal
main "$@"
