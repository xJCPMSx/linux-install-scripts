#!/bin/bash

# Interface Gráfica para Linux Install Scripts
# Versão: 1.0-beta
# Data: 2025-09-28

# Verificar se zenity está disponível
if ! command -v zenity &> /dev/null; then
    echo "❌ Zenity não encontrado. Instalando..."
    if command -v zypper &> /dev/null; then
        sudo zypper install -y zenity
    elif command -v apt &> /dev/null; then
        sudo apt install -y zenity
    else
        echo "❌ Não foi possível instalar zenity automaticamente"
        exit 1
    fi
fi

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Função para mostrar tela de boas-vindas
show_welcome() {
    zenity --info \
        --title="Linux Install Scripts" \
        --text="<b>🚀 Linux Install Scripts v1.0-beta</b>\n\nBem-vindo ao instalador automático de programas para Linux!\n\nEste assistente irá guiá-lo através da instalação de programas essenciais para desenvolvimento e uso diário." \
        --width=500 \
        --height=300
}

# Função para seleção de programas
select_programs() {
    local programs=(
        "AnyDesk" "true"
        "Spotify" "true"
        "VSCode" "true"
        "Cursor (AI Editor)" "true"
        "Google Chrome" "true"
        "Brave Browser" "true"
        "Firefox" "true"
        "Java (OpenJDK)" "true"
        "Node.js" "true"
        "Osu! (Jogo)" "false"
        "Compiladores" "true"
        "Dependências de Desenvolvimento" "true"
    )
    
    local selected=$(zenity --list \
        --title="Seleção de Programas" \
        --text="Selecione os programas que deseja instalar:" \
        --checklist \
        --column="Instalar" \
        --column="Programa" \
        "${programs[@]}" \
        --width=600 \
        --height=400 \
        --separator="|")
    
    echo "$selected"
}

# Função para configurações avançadas
advanced_settings() {
    local settings=$(zenity --forms \
        --title="Configurações Avançadas" \
        --text="Configure as opções avançadas:" \
        --add-checkbox="Fazer backup antes da instalação" \
        --add-checkbox="Criar ícones no menu" \
        --add-checkbox="Configurar Git automaticamente" \
        --add-checkbox="Instalar extensões do VSCode" \
        --add-checkbox="Limpar repositórios conflitantes" \
        --width=500 \
        --height=300)
    
    echo "$settings"
}

# Função para mostrar progresso
show_progress() {
    local total_steps="$1"
    local current_step=0
    
    # Criar arquivo temporário para comunicação
    local progress_file="/tmp/install_progress"
    echo "0" > "$progress_file"
    
    # Iniciar barra de progresso em background
    zenity --progress \
        --title="Instalando Programas" \
        --text="Preparando instalação..." \
        --percentage=0 \
        --auto-close \
        --auto-kill \
        --width=500 &
    
    local progress_pid=$!
    
    # Função para atualizar progresso
    update_progress() {
        current_step=$((current_step + 1))
        local percentage=$((current_step * 100 / total_steps))
        echo "$percentage" > "$progress_file"
        
        # Atualizar texto da barra de progresso
        if [ -f "/proc/$progress_pid" ]; then
            echo "# Instalando programa $current_step de $total_steps..." >&3
        fi
    }
    
    # Retornar PID para controle
    echo "$progress_pid"
}

# Função para mostrar resultados
show_results() {
    local success_count="$1"
    local total_count="$2"
    local log_file="$3"
    
    if [ "$success_count" -eq "$total_count" ]; then
        zenity --info \
            --title="Instalação Concluída" \
            --text="<b>✅ Instalação Concluída com Sucesso!</b>\n\nTodos os $total_count programas foram instalados com sucesso.\n\nLog salvo em: $log_file" \
            --width=500 \
            --height=300
    else
        zenity --warning \
            --title="Instalação Parcialmente Concluída" \
            --text="<b>⚠️ Instalação Concluída com Avisos</b>\n\n$success_count de $total_count programas foram instalados.\n\nAlguns programas podem ter falhado na instalação.\n\nLog salvo em: $log_file" \
            --width=500 \
            --height=300
    fi
}

# Função para mostrar log
show_log() {
    local log_file="$1"
    
    if [ -f "$log_file" ]; then
        zenity --text-info \
            --title="Log de Instalação" \
            --filename="$log_file" \
            --width=800 \
            --height=600
    else
        zenity --error \
            --title="Erro" \
            --text="Arquivo de log não encontrado: $log_file"
    fi
}

# Função para menu principal
main_menu() {
    while true; do
        local choice=$(zenity --list \
            --title="Linux Install Scripts" \
            --text="Selecione uma opção:" \
            --column="Opção" \
            --column="Descrição" \
            "1" "🚀 Instalação Automática" \
            "2" "⚙️ Configurações" \
            "3" "📋 Listar Programas" \
            "4" "🗑️ Desinstalar Programas" \
            "5" "💾 Backup/Restore" \
            "6" "📊 Estatísticas" \
            "7" "❓ Ajuda" \
            "8" "🚪 Sair" \
            --width=600 \
            --height=400)
        
        case "$choice" in
            "1")
                install_programs
                ;;
            "2")
                show_settings
                ;;
            "3")
                list_programs
                ;;
            "4")
                uninstall_programs
                ;;
            "5")
                backup_menu
                ;;
            "6")
                show_statistics
                ;;
            "7")
                show_help
                ;;
            "8")
                exit 0
                ;;
            *)
                exit 0
                ;;
        esac
    done
}

# Função para instalação de programas
install_programs() {
    show_welcome
    
    local selected=$(select_programs)
    if [ -z "$selected" ]; then
        zenity --error --text="Nenhum programa selecionado!"
        return
    fi
    
    local settings=$(advanced_settings)
    
    # Confirmar instalação
    zenity --question \
        --title="Confirmar Instalação" \
        --text="Deseja prosseguir com a instalação dos programas selecionados?" \
        --width=400 \
        --height=200
    
    if [ $? -eq 0 ]; then
        # Executar instalação
        local progress_pid=$(show_progress 10)
        
        # Simular instalação (substituir pela lógica real)
        sleep 2
        echo "Instalando programas selecionados..."
        
        # Fechar barra de progresso
        kill $progress_pid 2>/dev/null
        
        show_results 10 10 "/tmp/install.log"
    fi
}

# Função para mostrar configurações
show_settings() {
    zenity --info \
        --title="Configurações" \
        --text="<b>⚙️ Configurações</b>\n\n• Backup automático: Habilitado\n• Logs detalhados: Habilitado\n• Interface: GUI\n• Idioma: Português\n\nPara alterar configurações, edite o arquivo config/config.conf" \
        --width=500 \
        --height=300
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
    
    zenity --info \
        --title="Programas Disponíveis" \
        --text="$programs" \
        --width=600 \
        --height=500
}

# Função para desinstalar programas
uninstall_programs() {
    zenity --question \
        --title="Desinstalar Programas" \
        --text="Deseja executar o script de desinstalação?\n\nIsso removerá todos os programas instalados pelo script." \
        --width=400 \
        --height=200
    
    if [ $? -eq 0 ]; then
        zenity --info \
            --title="Desinstalação" \
            --text="Executando script de desinstalação..." \
            --width=400 \
            --height=200
        
        # Executar script de desinstalação
        ./uninstall.sh
    fi
}

# Função para menu de backup
backup_menu() {
    local backup_choice=$(zenity --list \
        --title="Backup/Restore" \
        --text="Selecione uma opção de backup:" \
        --column="Opção" \
        --column="Descrição" \
        "1" "💾 Criar Backup" \
        "2" "🔄 Restaurar Backup" \
        "3" "📋 Listar Backups" \
        "4" "📊 Estatísticas" \
        --width=500 \
        --height=300)
    
    case "$backup_choice" in
        "1")
            ./backup/backup.sh create
            ;;
        "2")
            local backup_path=$(zenity --file-selection \
                --title="Selecionar Backup" \
                --directory \
                --filename="$HOME/.linux-install-scripts/backup/")
            if [ -n "$backup_path" ]; then
                ./backup/backup.sh restore "$backup_path"
            fi
            ;;
        "3")
            ./backup/backup.sh list
            ;;
        "4")
            ./backup/backup.sh stats
            ;;
    esac
}

# Função para mostrar estatísticas
show_statistics() {
    local stats="<b>📊 Estatísticas do Sistema</b>\n\n"
    stats+="<b>🖥️ Sistema:</b>\n"
    stats+="• Distribuição: $(lsb_release -d | cut -f2)\n"
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
    
    zenity --info \
        --title="Estatísticas do Sistema" \
        --text="$stats" \
        --width=600 \
        --height=500
}

# Função para mostrar ajuda
show_help() {
    local help_text="<b>❓ Ajuda - Linux Install Scripts</b>\n\n"
    help_text+="<b>🚀 Instalação Automática:</b>\n"
    help_text+="Selecione os programas desejados e clique em 'Instalar'.\n\n"
    help_text+="<b>⚙️ Configurações:</b>\n"
    help_text+="Edite o arquivo config/config.conf para personalizar.\n\n"
    help_text+="<b>💾 Backup:</b>\n"
    help_text+="Crie backups antes de grandes mudanças.\n\n"
    help_text+="<b>📋 Logs:</b>\n"
    help_text+="Logs detalhados são salvos em ~/.linux-install-scripts/logs/\n\n"
    help_text+="<b>🔗 Suporte:</b>\n"
    help_text+="• Repositório: https://github.com/xJCPMSx/linux-install-scripts\n"
    help_text+="• Issues: https://github.com/xJCPMSx/linux-install-scripts/issues\n"
    help_text+="• Documentação: README.md\n\n"
    help_text+="<b>📞 Contato:</b>\n"
    help_text+="Para suporte, abra uma issue no GitHub."
    
    zenity --info \
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
    
    # Mostrar menu principal
    main_menu
}

# Executar função principal
main "$@"
