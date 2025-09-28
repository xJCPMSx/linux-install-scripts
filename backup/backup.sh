#!/bin/bash

# Sistema de Backup
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configurações de backup
BACKUP_DIR="$HOME/.linux-install-scripts/backup"
BACKUP_DATE=$(date +%Y%m%d-%H%M%S)
BACKUP_NAME="backup-$BACKUP_DATE"
KEEP_BACKUPS=5

# Função para criar backup
create_backup() {
    echo -e "${BLUE}💾 Criando backup do sistema...${NC}"
    
    # Criar diretório de backup
    mkdir -p "$BACKUP_DIR/$BACKUP_NAME"
    
    # Backup de configurações do sistema
    echo -e "${CYAN}📋 Fazendo backup de configurações...${NC}"
    
    # Backup de repositórios
    if [ -f "/etc/zypp/repos.d" ]; then
        cp -r /etc/zypp/repos.d "$BACKUP_DIR/$BACKUP_NAME/" 2>/dev/null || true
    fi
    
    if [ -f "/etc/apt/sources.list" ]; then
        cp /etc/apt/sources.list "$BACKUP_DIR/$BACKUP_NAME/" 2>/dev/null || true
        cp -r /etc/apt/sources.list.d "$BACKUP_DIR/$BACKUP_NAME/" 2>/dev/null || true
    fi
    
    # Backup de configurações do usuário
    echo -e "${CYAN}👤 Fazendo backup de configurações do usuário...${NC}"
    
    # Configurações importantes do usuário
    local user_configs=(
        "$HOME/.bashrc"
        "$HOME/.bash_profile"
        "$HOME/.profile"
        "$HOME/.gitconfig"
        "$HOME/.ssh"
        "$HOME/.config"
        "$HOME/.local/share/applications"
    )
    
    for config in "${user_configs[@]}"; do
        if [ -e "$config" ]; then
            echo "Backup: $config"
            cp -r "$config" "$BACKUP_DIR/$BACKUP_NAME/" 2>/dev/null || true
        fi
    done
    
    # Backup de programas instalados
    echo -e "${CYAN}📦 Fazendo backup de lista de programas...${NC}"
    
    # Lista de pacotes instalados
    if command -v zypper &> /dev/null; then
        zypper packages --installed-only > "$BACKUP_DIR/$BACKUP_NAME/installed-packages-zypper.txt" 2>/dev/null || true
    fi
    
    if command -v dpkg &> /dev/null; then
        dpkg -l > "$BACKUP_DIR/$BACKUP_NAME/installed-packages-dpkg.txt" 2>/dev/null || true
    fi
    
    # Lista de Flatpaks
    if command -v flatpak &> /dev/null; then
        flatpak list > "$BACKUP_DIR/$BACKUP_NAME/installed-flatpaks.txt" 2>/dev/null || true
    fi
    
    # Informações do sistema
    echo -e "${CYAN}🖥️ Fazendo backup de informações do sistema...${NC}"
    {
        echo "=== Informações do Sistema ==="
        echo "Data: $(date)"
        echo "Usuário: $USER"
        echo "Sistema: $(uname -a)"
        echo "Distribuição: $(lsb_release -a 2>/dev/null || cat /etc/os-release)"
        echo ""
        echo "=== Memória ==="
        free -h
        echo ""
        echo "=== Disco ==="
        df -h
        echo ""
        echo "=== Processos ==="
        ps aux | head -20
    } > "$BACKUP_DIR/$BACKUP_NAME/system-info.txt"
    
    # Criar arquivo de manifesto
    echo -e "${CYAN}📄 Criando manifesto do backup...${NC}"
    cat > "$BACKUP_DIR/$BACKUP_NAME/MANIFEST.txt" << EOF
Linux Install Scripts - Backup
==============================
Data: $(date)
Usuário: $USER
Sistema: $(uname -a)
Tamanho: $(du -sh "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)

Conteúdo do Backup:
- Configurações de repositórios
- Configurações do usuário
- Lista de programas instalados
- Informações do sistema
- Manifesto (este arquivo)

Para restaurar:
1. Copie os arquivos de volta para suas localizações originais
2. Execute os comandos de instalação apropriados
3. Verifique as configurações

Backup criado por: Linux Install Scripts v1.0-beta
EOF
    
    echo -e "${GREEN}✅ Backup criado com sucesso!${NC}"
    echo -e "${BLUE}📁 Localização: $BACKUP_DIR/$BACKUP_NAME${NC}"
    echo -e "${BLUE}📊 Tamanho: $(du -sh "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)${NC}"
    
    # Limpar backups antigos
    cleanup_old_backups
}

# Função para restaurar backup
restore_backup() {
    local backup_path="$1"
    
    if [ -z "$backup_path" ]; then
        echo -e "${RED}❌ Erro: Caminho do backup não especificado${NC}"
        return 1
    fi
    
    if [ ! -d "$backup_path" ]; then
        echo -e "${RED}❌ Erro: Backup não encontrado: $backup_path${NC}"
        return 1
    fi
    
    echo -e "${BLUE}🔄 Restaurando backup de: $backup_path${NC}"
    
    # Restaurar configurações
    if [ -d "$backup_path/sources.list.d" ]; then
        echo "Restaurando repositórios APT..."
        sudo cp -r "$backup_path/sources.list.d" /etc/apt/ 2>/dev/null || true
    fi
    
    if [ -d "$backup_path/repos.d" ]; then
        echo "Restaurando repositórios Zypper..."
        sudo cp -r "$backup_path/repos.d" /etc/zypp/ 2>/dev/null || true
    fi
    
    # Restaurar configurações do usuário
    echo "Restaurando configurações do usuário..."
    cp -r "$backup_path/.bashrc" "$HOME/" 2>/dev/null || true
    cp -r "$backup_path/.gitconfig" "$HOME/" 2>/dev/null || true
    cp -r "$backup_path/.ssh" "$HOME/" 2>/dev/null || true
    cp -r "$backup_path/.config" "$HOME/" 2>/dev/null || true
    cp -r "$backup_path/.local" "$HOME/" 2>/dev/null || true
    
    echo -e "${GREEN}✅ Backup restaurado com sucesso!${NC}"
}

# Função para listar backups
list_backups() {
    echo -e "${BLUE}📋 Lista de Backups Disponíveis:${NC}"
    echo "=================================="
    
    if [ -d "$BACKUP_DIR" ]; then
        for backup in "$BACKUP_DIR"/backup-*; do
            if [ -d "$backup" ]; then
                local backup_name=$(basename "$backup")
                local backup_date=$(echo "$backup_name" | cut -d'-' -f2-3)
                local backup_size=$(du -sh "$backup" | cut -f1)
                echo "📁 $backup_name"
                echo "   Data: $backup_date"
                echo "   Tamanho: $backup_size"
                echo ""
            fi
        done
    else
        echo -e "${YELLOW}⚠️ Nenhum backup encontrado${NC}"
    fi
}

# Função para limpar backups antigos
cleanup_old_backups() {
    echo -e "${CYAN}🧹 Limpando backups antigos...${NC}"
    
    # Manter apenas os últimos N backups
    local backup_count=$(ls -1 "$BACKUP_DIR"/backup-* 2>/dev/null | wc -l)
    
    if [ "$backup_count" -gt "$KEEP_BACKUPS" ]; then
        local to_remove=$((backup_count - KEEP_BACKUPS))
        echo "Removendo $to_remove backup(s) antigo(s)..."
        
        ls -1t "$BACKUP_DIR"/backup-* | tail -n "$to_remove" | while read -r old_backup; do
            echo "Removendo: $(basename "$old_backup")"
            rm -rf "$old_backup"
        done
    fi
    
    echo -e "${GREEN}✅ Limpeza concluída${NC}"
}

# Função para mostrar estatísticas
show_backup_stats() {
    echo -e "${BLUE}📊 Estatísticas de Backup:${NC}"
    echo "=============================="
    
    if [ -d "$BACKUP_DIR" ]; then
        local total_backups=$(ls -1 "$BACKUP_DIR"/backup-* 2>/dev/null | wc -l)
        local total_size=$(du -sh "$BACKUP_DIR" | cut -f1)
        
        echo "Total de backups: $total_backups"
        echo "Tamanho total: $total_size"
        echo "Diretório: $BACKUP_DIR"
        echo ""
        
        echo -e "${CYAN}📋 Últimos backups:${NC}"
        ls -1t "$BACKUP_DIR"/backup-* 2>/dev/null | head -5 | while read -r backup; do
            local backup_name=$(basename "$backup")
            local backup_size=$(du -sh "$backup" | cut -f1)
            echo "  📁 $backup_name ($backup_size)"
        done
    else
        echo -e "${YELLOW}⚠️ Nenhum backup encontrado${NC}"
    fi
}

# Função principal
main() {
    case "$1" in
        "create")
            create_backup
            ;;
        "restore")
            restore_backup "$2"
            ;;
        "list")
            list_backups
            ;;
        "cleanup")
            cleanup_old_backups
            ;;
        "stats")
            show_backup_stats
            ;;
        *)
            echo -e "${BLUE}💾 Sistema de Backup - Linux Install Scripts${NC}"
            echo "=============================================="
            echo ""
            echo "Uso: $0 {create|restore|list|cleanup|stats}"
            echo ""
            echo "Comandos:"
            echo "  create   - Criar novo backup"
            echo "  restore  - Restaurar backup (especificar caminho)"
            echo "  list     - Listar backups disponíveis"
            echo "  cleanup  - Limpar backups antigos"
            echo "  stats    - Mostrar estatísticas"
            echo ""
            ;;
    esac
}

# Executar função principal
main "$@"
