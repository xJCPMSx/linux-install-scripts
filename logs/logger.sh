#!/bin/bash

# Sistema de Logs Detalhados
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configurações de log
LOG_DIR="$HOME/.linux-install-scripts/logs"
LOG_FILE="$LOG_DIR/install-$(date +%Y%m%d-%H%M%S).log"
MAX_LOG_SIZE=10485760  # 10MB
MAX_LOG_FILES=5

# Criar diretório de logs se não existir
mkdir -p "$LOG_DIR"

# Função para inicializar o sistema de logs
init_logger() {
    echo -e "${BLUE}📝 Inicializando sistema de logs...${NC}"
    echo "==========================================" >> "$LOG_FILE"
    echo "Linux Install Scripts - Log de Instalação" >> "$LOG_FILE"
    echo "Data: $(date)" >> "$LOG_FILE"
    echo "Usuário: $USER" >> "$LOG_FILE"
    echo "Sistema: $(uname -a)" >> "$LOG_FILE"
    echo "==========================================" >> "$LOG_FILE"
    echo ""
}

# Função para log de informações
log_info() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${BLUE}[INFO]${NC} $message"
    echo "[$timestamp] [INFO] $message" >> "$LOG_FILE"
}

# Função para log de sucesso
log_success() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${GREEN}[SUCCESS]${NC} $message"
    echo "[$timestamp] [SUCCESS] $message" >> "$LOG_FILE"
}

# Função para log de aviso
log_warning() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${YELLOW}[WARNING]${NC} $message"
    echo "[$timestamp] [WARNING] $message" >> "$LOG_FILE"
}

# Função para log de erro
log_error() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${RED}[ERROR]${NC} $message"
    echo "[$timestamp] [ERROR] $message" >> "$LOG_FILE"
}

# Função para log de debug
log_debug() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    if [ "$DEBUG" = "true" ]; then
        echo -e "${PURPLE}[DEBUG]${NC} $message"
        echo "[$timestamp] [DEBUG] $message" >> "$LOG_FILE"
    fi
}

# Função para log de comando
log_command() {
    local command="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [COMMAND] Executando: $command" >> "$LOG_FILE"
    
    # Executar comando e capturar output
    local output
    local exit_code
    output=$(eval "$command" 2>&1)
    exit_code=$?
    
    echo "[$timestamp] [COMMAND] Exit code: $exit_code" >> "$LOG_FILE"
    echo "[$timestamp] [COMMAND] Output: $output" >> "$LOG_FILE"
    
    return $exit_code
}

# Função para rotação de logs
rotate_logs() {
    if [ -f "$LOG_FILE" ] && [ $(stat -f%z "$LOG_FILE" 2>/dev/null || stat -c%s "$LOG_FILE" 2>/dev/null) -gt $MAX_LOG_SIZE ]; then
        log_info "Log file too large, rotating..."
        mv "$LOG_FILE" "$LOG_FILE.old"
        touch "$LOG_FILE"
    fi
    
    # Manter apenas os últimos N arquivos de log
    ls -t "$LOG_DIR"/install-*.log | tail -n +$((MAX_LOG_FILES + 1)) | xargs -r rm -f
}

# Função para finalizar o sistema de logs
finish_logger() {
    local exit_code="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [ "$exit_code" = "0" ]; then
        echo "[$timestamp] [INFO] Instalação concluída com sucesso" >> "$LOG_FILE"
        log_success "Sistema de logs finalizado - Log salvo em: $LOG_FILE"
    else
        echo "[$timestamp] [ERROR] Instalação falhou com código: $exit_code" >> "$LOG_FILE"
        log_error "Sistema de logs finalizado - Log salvo em: $LOG_FILE"
    fi
    
    echo "==========================================" >> "$LOG_FILE"
    echo "Fim do log - $(date)" >> "$LOG_FILE"
    echo "==========================================" >> "$LOG_FILE"
}

# Função para mostrar estatísticas do log
show_log_stats() {
    if [ -f "$LOG_FILE" ]; then
        echo -e "${CYAN}📊 Estatísticas do Log:${NC}"
        echo "Arquivo: $LOG_FILE"
        echo "Tamanho: $(du -h "$LOG_FILE" | cut -f1)"
        echo "Linhas: $(wc -l < "$LOG_FILE")"
        echo ""
        echo -e "${CYAN}📈 Resumo:${NC}"
        echo "Sucessos: $(grep -c "\[SUCCESS\]" "$LOG_FILE")"
        echo "Avisos: $(grep -c "\[WARNING\]" "$LOG_FILE")"
        echo "Erros: $(grep -c "\[ERROR\]" "$LOG_FILE")"
        echo "Comandos: $(grep -c "\[COMMAND\]" "$LOG_FILE")"
    fi
}

# Exportar funções para uso em outros scripts
export -f log_info log_success log_warning log_error log_debug log_command
export -f init_logger finish_logger show_log_stats rotate_logs
