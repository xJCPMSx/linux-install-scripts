#!/bin/bash

# Sistema de Logging Unificado para Linux Install Scripts
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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
    echo -e "${CYAN}[DEBUG]${NC} $message"
    echo "[$timestamp] [DEBUG] $message" >> "$LOG_FILE"
}

# Função para verificar se o comando foi executado com sucesso (com logging)
check_success() {
    local program="$1"
    if [ $? -eq 0 ]; then
        log_success "$program instalado com sucesso"
    else
        log_error "Erro ao instalar $program"
        log_warning "Continuando com os próximos programas..."
    fi
}

# Função para rotação de logs
rotate_logs() {
    # Verificar tamanho do log atual
    if [ -f "$LOG_FILE" ] && [ $(stat -f%z "$LOG_FILE" 2>/dev/null || stat -c%s "$LOG_FILE" 2>/dev/null) -gt $MAX_LOG_SIZE ]; then
        log_info "Log atingiu tamanho máximo. Rotacionando..."
        mv "$LOG_FILE" "$LOG_FILE.old"
        touch "$LOG_FILE"
    fi
    
    # Limpar logs antigos
    local log_count=$(ls -1 "$LOG_DIR"/install-*.log* 2>/dev/null | wc -l)
    if [ "$log_count" -gt "$MAX_LOG_FILES" ]; then
        log_info "Removendo logs antigos..."
        ls -1t "$LOG_DIR"/install-*.log* | tail -n +$((MAX_LOG_FILES + 1)) | xargs rm -f
    fi
}

# Função para finalizar o sistema de logs
finish_logger() {
    local exit_code="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [ "$exit_code" -eq 0 ]; then
        log_success "Script finalizado com sucesso!"
    else
        log_error "Script finalizado com erros (código: $exit_code)"
    fi
    
    echo "==========================================" >> "$LOG_FILE"
    echo "Log finalizado em: $timestamp" >> "$LOG_FILE"
    echo "==========================================" >> "$LOG_FILE"
    
    # Rotacionar logs se necessário
    rotate_logs
}

# Função para mostrar estatísticas de logs
show_log_stats() {
    echo -e "${CYAN}📊 Estatísticas de Logs:${NC}"
    echo "=========================================="
    echo "📁 Diretório: $LOG_DIR"
    echo "📄 Log atual: $LOG_FILE"
    echo "📏 Tamanho: $(du -h "$LOG_FILE" 2>/dev/null | cut -f1 || echo "N/A")"
    echo "📊 Total de logs: $(ls -1 "$LOG_DIR"/install-*.log* 2>/dev/null | wc -l)"
    echo "🗂️ Logs disponíveis:"
    ls -lh "$LOG_DIR"/install-*.log* 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}' || echo "  Nenhum log encontrado"
    echo "=========================================="
}
