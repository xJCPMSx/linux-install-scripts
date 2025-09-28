#!/bin/bash

# Script de Backup - Linux Installation Scripts
# Cria backup das configurações antes da instalação

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
BACKUP_DIR="$HOME/.linux-install-scripts/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_${TIMESTAMP}"

# Função para exibir cabeçalho
show_header() {
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}💾 Script de Backup - Linux Scripts${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo -e "${BLUE}📅 Data: $(date)${NC}"
    echo -e "${BLUE}🐧 Sistema: $(uname -s) $(uname -r)${NC}"
    echo -e "${BLUE}🔧 Versão: Backup v1.0${NC}"
    echo ""
}

# Função para criar diretório de backup
create_backup_dir() {
    echo -e "${YELLOW}📁 Criando diretório de backup...${NC}"
    mkdir -p "$BACKUP_DIR/$BACKUP_NAME"
    echo -e "${GREEN}✓ Diretório criado: $BACKUP_DIR/$BACKUP_NAME${NC}"
}

# Função para backup de configurações do sistema
backup_system_config() {
    echo -e "${BLUE}🔧 Fazendo backup das configurações do sistema...${NC}"
    
    # Backup de repositórios
    echo -e "${YELLOW}  📦 Repositórios...${NC}"
    if [ -d "/etc/zypp/repos.d" ]; then
        cp -r /etc/zypp/repos.d "$BACKUP_DIR/$BACKUP_NAME/repos_zypp" 2>/dev/null || echo "    Repositórios Zypper não encontrados"
    fi
    
    if [ -d "/etc/apt/sources.list.d" ]; then
        cp -r /etc/apt/sources.list.d "$BACKUP_DIR/$BACKUP_NAME/repos_apt" 2>/dev/null || echo "    Repositórios APT não encontrados"
    fi
    
    # Backup de chaves GPG
    echo -e "${YELLOW}  🔑 Chaves GPG...${NC}"
    if [ -d "/etc/apt/trusted.gpg.d" ]; then
        cp -r /etc/apt/trusted.gpg.d "$BACKUP_DIR/$BACKUP_NAME/gpg_apt" 2>/dev/null || echo "    Chaves GPG APT não encontradas"
    fi
    
    if [ -d "/usr/share/keyrings" ]; then
        cp -r /usr/share/keyrings "$BACKUP_DIR/$BACKUP_NAME/keyrings" 2>/dev/null || echo "    Keyrings não encontrados"
    fi
    
    # Backup de configurações do Java
    echo -e "${YELLOW}  ☕ Java...${NC}"
    if [ -f "/etc/alternatives/java" ]; then
        cp /etc/alternatives/java "$BACKUP_DIR/$BACKUP_NAME/java_alternative" 2>/dev/null || echo "    Alternativa do Java não encontrada"
    fi
    
    # Backup de configurações do Git
    echo -e "${YELLOW}  📝 Git...${NC}"
    if [ -f "$HOME/.gitconfig" ]; then
        cp "$HOME/.gitconfig" "$BACKUP_DIR/$BACKUP_NAME/gitconfig" 2>/dev/null || echo "    Configuração do Git não encontrada"
    fi
    
    echo -e "${GREEN}✓ Backup das configurações do sistema concluído!${NC}"
}

# Função para backup de configurações do usuário
backup_user_config() {
    echo -e "${BLUE}👤 Fazendo backup das configurações do usuário...${NC}"
    
    # Backup de configurações do VSCode
    echo -e "${YELLOW}  📝 VSCode...${NC}"
    if [ -d "$HOME/.vscode" ]; then
        cp -r "$HOME/.vscode" "$BACKUP_DIR/$BACKUP_NAME/vscode" 2>/dev/null || echo "    Configurações do VSCode não encontradas"
    fi
    
    # Backup de configurações do Cursor
    echo -e "${YELLOW}  🎯 Cursor...${NC}"
    if [ -d "$HOME/.cursor" ]; then
        cp -r "$HOME/.cursor" "$BACKUP_DIR/$BACKUP_NAME/cursor" 2>/dev/null || echo "    Configurações do Cursor não encontradas"
    fi
    
    # Backup de configurações do Spotify
    echo -e "${YELLOW}  🎵 Spotify...${NC}"
    if [ -d "$HOME/.config/spotify" ]; then
        cp -r "$HOME/.config/spotify" "$BACKUP_DIR/$BACKUP_NAME/spotify" 2>/dev/null || echo "    Configurações do Spotify não encontradas"
    fi
    
    # Backup de configurações do Chrome
    echo -e "${YELLOW}  🌐 Chrome...${NC}"
    if [ -d "$HOME/.config/google-chrome" ]; then
        cp -r "$HOME/.config/google-chrome" "$BACKUP_DIR/$BACKUP_NAME/chrome" 2>/dev/null || echo "    Configurações do Chrome não encontradas"
    fi
    
    # Backup de configurações do Brave
    echo -e "${YELLOW}  🦁 Brave...${NC}"
    if [ -d "$HOME/.config/BraveSoftware" ]; then
        cp -r "$HOME/.config/BraveSoftware" "$BACKUP_DIR/$BACKUP_NAME/brave" 2>/dev/null || echo "    Configurações do Brave não encontradas"
    fi
    
    # Backup de configurações do Firefox
    echo -e "${YELLOW}  🦊 Firefox...${NC}"
    if [ -d "$HOME/.mozilla" ]; then
        cp -r "$HOME/.mozilla" "$BACKUP_DIR/$BACKUP_NAME/firefox" 2>/dev/null || echo "    Configurações do Firefox não encontradas"
    fi
    
    # Backup de configurações do AnyDesk
    echo -e "${YELLOW}  🖥️  AnyDesk...${NC}"
    if [ -d "$HOME/.anydesk" ]; then
        cp -r "$HOME/.anydesk" "$BACKUP_DIR/$BACKUP_NAME/anydesk" 2>/dev/null || echo "    Configurações do AnyDesk não encontradas"
    fi
    
    # Backup de configurações do Osu!
    echo -e "${YELLOW}  🎮 Osu!...${NC}"
    if [ -d "$HOME/.local/share/osu" ]; then
        cp -r "$HOME/.local/share/osu" "$BACKUP_DIR/$BACKUP_NAME/osu" 2>/dev/null || echo "    Configurações do Osu! não encontradas"
    fi
    
    echo -e "${GREEN}✓ Backup das configurações do usuário concluído!${NC}"
}

# Função para backup de aplicativos
backup_applications() {
    echo -e "${BLUE}📱 Fazendo backup dos aplicativos...${NC}"
    
    # Backup de AppImages
    echo -e "${YELLOW}  📦 AppImages...${NC}"
    if [ -d "$HOME/Applications" ]; then
        cp -r "$HOME/Applications" "$BACKUP_DIR/$BACKUP_NAME/applications" 2>/dev/null || echo "    Diretório Applications não encontrado"
    fi
    
    # Backup de desktop files
    echo -e "${YELLOW}  🖥️  Desktop Files...${NC}"
    if [ -d "$HOME/.local/share/applications" ]; then
        cp -r "$HOME/.local/share/applications" "$BACKUP_DIR/$BACKUP_NAME/desktop_files" 2>/dev/null || echo "    Desktop files não encontrados"
    fi
    
    # Backup de ícones
    echo -e "${YELLOW}  🎨 Ícones...${NC}"
    if [ -d "$HOME/.local/share/icons" ]; then
        cp -r "$HOME/.local/share/icons" "$BACKUP_DIR/$BACKUP_NAME/icons" 2>/dev/null || echo "    Ícones não encontrados"
    fi
    
    echo -e "${GREEN}✓ Backup dos aplicativos concluído!${NC}"
}

# Função para criar arquivo de informações
create_info_file() {
    echo -e "${BLUE}📋 Criando arquivo de informações...${NC}"
    
    cat > "$BACKUP_DIR/$BACKUP_NAME/backup_info.txt" << EOF
# Informações do Backup
Data: $(date)
Sistema: $(uname -s) $(uname -r)
Usuário: $(whoami)
Diretório: $BACKUP_DIR/$BACKUP_NAME

# Distribuição
$(cat /etc/os-release 2>/dev/null || echo "Informações do sistema não disponíveis")

# Programas instalados
$(which code 2>/dev/null && echo "VSCode: $(code --version 2>/dev/null | head -1)" || echo "VSCode: Não instalado")
$(which node 2>/dev/null && echo "Node.js: $(node --version)" || echo "Node.js: Não instalado")
$(which java 2>/dev/null && echo "Java: $(java -version 2>&1 | head -1)" || echo "Java: Não instalado")
$(which git 2>/dev/null && echo "Git: $(git --version)" || echo "Git: Não instalado")

# Configurações do Git
$(git config --global --list 2>/dev/null || echo "Git não configurado")

# Repositórios
$(ls /etc/zypp/repos.d/ 2>/dev/null | wc -l) repositórios Zypper
$(ls /etc/apt/sources.list.d/ 2>/dev/null | wc -l) repositórios APT

# Tamanho do backup
$(du -sh "$BACKUP_DIR/$BACKUP_NAME" 2>/dev/null || echo "Tamanho não disponível")
EOF
    
    echo -e "${GREEN}✓ Arquivo de informações criado!${NC}"
}

# Função para compactar backup
compress_backup() {
    echo -e "${BLUE}📦 Compactando backup...${NC}"
    
    cd "$BACKUP_DIR"
    tar -czf "${BACKUP_NAME}.tar.gz" "$BACKUP_NAME"
    rm -rf "$BACKUP_NAME"
    
    echo -e "${GREEN}✓ Backup compactado: ${BACKUP_NAME}.tar.gz${NC}"
}

# Função para exibir resumo
show_summary() {
    echo ""
    echo -e "${GREEN}✅ Backup concluído com sucesso!${NC}"
    echo ""
    echo -e "${BLUE}📋 Resumo do backup:${NC}"
    echo -e "${CYAN}   - Diretório: $BACKUP_DIR/${BACKUP_NAME}.tar.gz${NC}"
    echo -e "${CYAN}   - Tamanho: $(du -sh "$BACKUP_DIR/${BACKUP_NAME}.tar.gz" 2>/dev/null | cut -f1)${NC}"
    echo -e "${CYAN}   - Data: $(date)${NC}"
    echo ""
    echo -e "${YELLOW}💡 Para restaurar o backup:${NC}"
    echo -e "${CYAN}   tar -xzf $BACKUP_DIR/${BACKUP_NAME}.tar.gz${NC}"
    echo ""
}

# Função principal
main() {
    show_header
    create_backup_dir
    backup_system_config
    backup_user_config
    backup_applications
    create_info_file
    compress_backup
    show_summary
}

# Executar função principal
main
