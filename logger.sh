#!/bin/bash

# Sistema de Logs Detalhados - Linux Installation Scripts
# Fornece logging avançado para troubleshooting

# Configurações
LOG_DIR="$HOME/.linux-install-scripts/logs"
LOG_FILE="$LOG_DIR/install_$(date +%Y%m%d_%H%M%S).log"
LOG_LEVEL="INFO" # DEBUG, INFO, WARN, ERROR

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Função para criar diretório de logs
init_logger() {
    mkdir -p "$LOG_DIR"
    touch "$LOG_FILE"
    echo "=== LOG INICIADO EM $(date) ===" >> "$LOG_FILE"
    echo "Sistema: $(uname -a)" >> "$LOG_FILE"
    echo "Usuário: $(whoami)" >> "$LOG_FILE"
    echo "Diretório: $(pwd)" >> "$LOG_FILE"
    echo "=================================" >> "$LOG_FILE"
}

# Função para log com nível
log() {
    local level=$1
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Verificar se deve logar baseado no nível
    case $LOG_LEVEL in
        "DEBUG")
            should_log=true
            ;;
        "INFO")
            if [[ "$level" == "DEBUG" ]]; then
                should_log=false
            else
                should_log=true
            fi
            ;;
        "WARN")
            if [[ "$level" == "DEBUG" || "$level" == "INFO" ]]; then
                should_log=false
            else
                should_log=true
            fi
            ;;
        "ERROR")
            if [[ "$level" == "ERROR" ]]; then
                should_log=true
            else
                should_log=false
            fi
            ;;
    esac
    
    if [ "$should_log" = true ]; then
        echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
        
        # Output colorido para terminal
        case $level in
            "DEBUG")
                echo -e "${BLUE}[$timestamp] [$level] $message${NC}"
                ;;
            "INFO")
                echo -e "${GREEN}[$timestamp] [$level] $message${NC}"
                ;;
            "WARN")
                echo -e "${YELLOW}[$timestamp] [$level] $message${NC}"
                ;;
            "ERROR")
                echo -e "${RED}[$timestamp] [$level] $message${NC}"
                ;;
        esac
    fi
}

# Função para log de comando
log_command() {
    local command=$1
    local description=$2
    
    log "INFO" "Executando: $description"
    log "DEBUG" "Comando: $command"
    
    # Executar comando e capturar output
    local output
    local exit_code
    
    if output=$(eval "$command" 2>&1); then
        exit_code=0
        log "INFO" "Comando executado com sucesso"
        log "DEBUG" "Output: $output"
    else
        exit_code=$?
        log "ERROR" "Comando falhou com código: $exit_code"
        log "ERROR" "Output: $output"
    fi
    
    return $exit_code
}

# Função para log de instalação de programa
log_program_install() {
    local program=$1
    local method=$2
    local status=$3
    local details=$4
    
    log "INFO" "Instalação do $program via $method: $status"
    if [ ! -z "$details" ]; then
        log "DEBUG" "Detalhes: $details"
    fi
}

# Função para log de erro
log_error() {
    local error=$1
    local context=$2
    
    log "ERROR" "Erro: $error"
    if [ ! -z "$context" ]; then
        log "ERROR" "Contexto: $context"
    fi
    
    # Capturar stack trace se disponível
    log "DEBUG" "Stack trace:"
    local i=0
    while caller $i; do
        ((i++))
    done >> "$LOG_FILE"
}

# Função para log de sistema
log_system_info() {
    log "INFO" "=== INFORMAÇÕES DO SISTEMA ==="
    log "INFO" "Distribuição: $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '\"')"
    log "INFO" "Kernel: $(uname -r)"
    log "INFO" "Arquitetura: $(uname -m)"
    log "INFO" "Memória: $(free -h | grep Mem | awk '{print $2}')"
    log "INFO" "Espaço em disco: $(df -h / | tail -1 | awk '{print $4}')"
    log "INFO" "Usuário: $(whoami)"
    log "INFO" "Shell: $SHELL"
    log "INFO" "PATH: $PATH"
    log "INFO" "================================"
}

# Função para log de dependências
log_dependencies() {
    log "INFO" "=== VERIFICAÇÃO DE DEPENDÊNCIAS ==="
    
    # Verificar comandos essenciais
    local commands=("curl" "wget" "git" "sudo" "tar" "unzip")
    for cmd in "${commands[@]}"; do
        if command -v "$cmd" &> /dev/null; then
            log "INFO" "✓ $cmd disponível: $(which $cmd)"
        else
            log "WARN" "✗ $cmd não encontrado"
        fi
    done
    
    # Verificar repositórios
    if [ -f "/etc/zypp/repos.d" ]; then
        log "INFO" "Repositórios Zypper: $(ls /etc/zypp/repos.d/ | wc -l)"
    fi
    
    if [ -f "/etc/apt/sources.list.d" ]; then
        log "INFO" "Repositórios APT: $(ls /etc/apt/sources.list.d/ | wc -l)"
    fi
    
    log "INFO" "=================================="
}

# Função para log de progresso
log_progress() {
    local step=$1
    local total=$2
    local description=$3
    
    local percentage=$((step * 100 / total))
    log "INFO" "Progresso: $step/$total ($percentage%) - $description"
}

# Função para log de backup
log_backup() {
    local action=$1
    local path=$2
    local size=$3
    
    log "INFO" "Backup $action: $path"
    if [ ! -z "$size" ]; then
        log "INFO" "Tamanho: $size"
    fi
}

# Função para log de configuração
log_config() {
    local config_file=$1
    local setting=$2
    local value=$3
    
    log "DEBUG" "Configuração: $setting = $value (arquivo: $config_file)"
}

# Função para log de rede
log_network() {
    local url=$1
    local method=$2
    local status=$3
    local size=$4
    
    log "INFO" "Rede: $method $url - Status: $status"
    if [ ! -z "$size" ]; then
        log "INFO" "Tamanho: $size"
    fi
}

# Função para log de permissões
log_permissions() {
    local file=$1
    local permissions=$2
    
    log "DEBUG" "Permissões: $file -> $permissions"
}

# Função para log de limpeza
log_cleanup() {
    local action=$1
    local path=$2
    local result=$3
    
    log "INFO" "Limpeza $action: $path - $result"
}

# Função para gerar relatório
generate_report() {
    local report_file="$LOG_DIR/report_$(date +%Y%m%d_%H%M%S).txt"
    
    log "INFO" "Gerando relatório: $report_file"
    
    cat > "$report_file" << EOF
# Relatório de Instalação - Linux Scripts
Data: $(date)
Sistema: $(uname -a)
Usuário: $(whoami)

## Resumo
- Logs salvos em: $LOG_FILE
- Nível de log: $LOG_LEVEL
- Total de linhas: $(wc -l < "$LOG_FILE")

## Estatísticas
- Erros: $(grep -c "ERROR" "$LOG_FILE")
- Avisos: $(grep -c "WARN" "$LOG_FILE")
- Informações: $(grep -c "INFO" "$LOG_FILE")
- Debug: $(grep -c "DEBUG" "$LOG_FILE")

## Últimas 10 linhas
$(tail -10 "$LOG_FILE")

## Comandos executados
$(grep "Executando:" "$LOG_FILE")

## Erros encontrados
$(grep "ERROR" "$LOG_FILE")
EOF
    
    log "INFO" "Relatório gerado: $report_file"
}

# Função para limpar logs antigos
cleanup_old_logs() {
    local days=${1:-7}
    
    log "INFO" "Limpando logs antigos (mais de $days dias)"
    
    find "$LOG_DIR" -name "*.log" -mtime +$days -delete 2>/dev/null || true
    find "$LOG_DIR" -name "report_*.txt" -mtime +$days -delete 2>/dev/null || true
    
    log "INFO" "Limpeza de logs concluída"
}

# Função para exibir logs em tempo real
tail_logs() {
    local log_file=${1:-"$LOG_FILE"}
    
    if [ -f "$log_file" ]; then
        log "INFO" "Exibindo logs em tempo real: $log_file"
        tail -f "$log_file"
    else
        log "ERROR" "Arquivo de log não encontrado: $log_file"
    fi
}

# Função para buscar em logs
search_logs() {
    local pattern=$1
    local log_file=${2:-"$LOG_FILE"}
    
    if [ -f "$log_file" ]; then
        log "INFO" "Buscando padrão: $pattern"
        grep -n "$pattern" "$log_file" || log "INFO" "Padrão não encontrado"
    else
        log "ERROR" "Arquivo de log não encontrado: $log_file"
    fi
}

# Função para exibir estatísticas
show_stats() {
    local log_file=${1:-"$LOG_FILE"}
    
    if [ -f "$log_file" ]; then
        echo -e "${BLUE}📊 Estatísticas do Log: $log_file${NC}"
        echo -e "${GREEN}Total de linhas: $(wc -l < "$log_file")${NC}"
        echo -e "${RED}Erros: $(grep -c "ERROR" "$log_file")${NC}"
        echo -e "${YELLOW}Avisos: $(grep -c "WARN" "$log_file")${NC}"
        echo -e "${BLUE}Informações: $(grep -c "INFO" "$log_file")${NC}"
        echo -e "${PURPLE}Debug: $(grep -c "DEBUG" "$log_file")${NC}"
    else
        echo -e "${RED}❌ Arquivo de log não encontrado: $log_file${NC}"
    fi
}

# Inicializar logger
init_logger

# Exportar funções para uso em outros scripts
export -f log log_command log_program_install log_error log_system_info log_dependencies log_progress log_backup log_config log_network log_permissions log_cleanup generate_report cleanup_old_logs tail_logs search_logs show_stats
