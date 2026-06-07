#!/bin/bash

# Script de Instalação Automática para Debian/Ubuntu
# Instala programas essenciais, dependências e configurações
# Versão: 1.1-stable - Versão estável

# ============================================
# Frontend não-interativo para evitar erros de dialog/debconf
# ============================================
export DEBIAN_FRONTEND=noninteractive

echo "🚀 Script de Instalação Automática - Debian/Ubuntu v1.1-stable"
echo "============================================================"
echo "📅 Data: $(date)"
echo "🐧 Sistema: $(lsb_release -d | cut -f2)"
echo "🔧 Versão: 1.1-stable (Versão estável)"
echo ""

# Nao usar set -e: check_success() gerencia falhas gracefulmente

# ============================================
# Configurações para execução não-interativa do apt
# ============================================
# Funções para evitar SC2089/SC2090 (variáveis com flags complexas)
apt_install() {
    sudo apt-get -y \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        install "$@"
    return $?
}

apt_remove() {
    sudo apt-get -y remove "$@"
}

apt_update() {
    sudo apt-get -y update
}

apt_upgrade() {
    sudo apt-get -y \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        upgrade
}

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Variável global para .bashrc (evita SC2034)
BASHRC="${HOME}/.bashrc"

# Função para adicionar variáveis ao .bashrc sem duplicação (evita SC2129)
add_to_bashrc() {
    local line="$1"
    if ! grep -qxF "$line" "$BASHRC" 2>/dev/null; then
        echo "$line" >> "$BASHRC"
    fi
}

# Função para corrigir prefix do npm (evita erro "config prefix cannot be changed")
fix_npm_prefix() {
    if [ -f "$HOME/.npmrc" ]; then
        sed -i '/^prefix=/d' "$HOME/.npmrc" 2>/dev/null || true
    fi
    unset npm_config_prefix 2>/dev/null || true
    export NPM_CONFIG_PREFIX="" 2>/dev/null || true
}

# Função para carregar configurações do config.conf
load_config() {
    local config_file="config/config.conf"
    if [ -f "$config_file" ]; then
        # shellcheck source=/dev/null
        source "$config_file" 2>/dev/null || true
        echo "✓ Configurações carregadas de $config_file"
    else
        echo "⚠️  Arquivo de configuração não encontrado: $config_file"
        echo "   Usando configurações padrão"
    fi
}

# Função para verificar sucesso
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1 instalado com sucesso${NC}"
    else
        echo -e "${YELLOW}⚠️  $1 - continuando execução${NC}"
    fi
}

# Função para otimizações do KDE
optimize_kde() {
    if [ "${DISABLE_KDE_WALLET:-true}" = "true" ]; then
        echo "🔧 Otimizando KDE Plasma..."
        
        # Desativar KDE Wallet
        echo "   Desativando KDE Wallet..."
        kwriteconfig5 --file kwalletrc --group Wallet --key Enabled false
        kwriteconfig5 --file kwalletrc --group Wallet --key First Use false
        
        # Desabilitar serviço KDE Wallet
        systemctl --user mask kwalletd5 2>/dev/null || true
        systemctl --user mask kwalletd6 2>/dev/null || true
        
        echo "✓ KDE Wallet desativado"
    fi
    
    if [ "${OPTIMIZE_KDE_PERFORMANCE:-true}" = "true" ]; then
        echo "   Otimizando performance do KDE..."
        
        # Otimizar compositor
        kwriteconfig5 --file kwinrc --group Compositing --key Backend OpenGL
        kwriteconfig5 --file kwinrc --group Compositing --key GLCore true
        
        # Otimizar animações
        if [ "${DISABLE_KDE_ANIMATIONS:-false}" = "true" ]; then
            kwriteconfig5 --file kwinrc --group Effect-kwin4_effect_translucency --key Decorations 0
            kwriteconfig5 --file kwinrc --group Effect-kwin4_effect_translucency --key Dialogs 0
        fi
        
        echo "✓ Performance do KDE otimizada"
    fi
    
    if [ "${CONFIGURE_KDE_THEME:-true}" = "true" ]; then
        echo "   Configurando tema do KDE..."
        
        # Configurar tema Breeze
        kwriteconfig5 --file kdeglobals --group KDE --key widgetStyle Breeze
        kwriteconfig5 --file kdeglobals --group General --key ColorScheme Breeze
        
        echo "✓ Tema do KDE configurado"
    fi
}

# Função para otimizações do sistema
optimize_system() {
    if [ "${ENABLE_TRIM:-true}" = "true" ]; then
        echo "🔧 Otimizando sistema..."
        
        # Habilitar TRIM para SSDs
        echo "   Habilitando TRIM para SSDs..."
        sudo systemctl enable fstrim.timer
        sudo systemctl start fstrim.timer
        
        echo "✓ TRIM habilitado"
    fi
    
    if [ "${OPTIMIZE_SWAP:-true}" = "true" ]; then
        echo "   Otimizando configurações de swap..."
        
        # Otimizar swappiness
        echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
        echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
        
        echo "✓ Swap otimizado"
    fi
    
    if [ "${DISABLE_UNNECESSARY_SERVICES:-true}" = "true" ]; then
        echo "   Desabilitando serviços desnecessários..."
        
        # Desabilitar serviços que podem ser desnecessários
        sudo systemctl disable bluetooth 2>/dev/null || true
        sudo systemctl disable cups 2>/dev/null || true
        sudo systemctl disable avahi-daemon 2>/dev/null || true
        
        echo "✓ Serviços desnecessários desabilitados"
    fi
    
    if [ "${OPTIMIZE_BOOT_TIME:-true}" = "true" ]; then
        echo "   Otimizando tempo de boot..."
        
        # Otimizar boot
        echo 'GRUB_TIMEOUT=3' | sudo tee -a /etc/default/grub
        sudo update-grub 2>/dev/null || true
        
        echo "✓ Boot otimizado"
    fi
}

# Função para otimizações de jogos no Debian/Ubuntu
optimize_gaming() {
    if [ "${ENABLE_GAMING_OPTIMIZATIONS:-true}" = "true" ]; then
        echo "🎮 Otimizando sistema para jogos..."
        
        # Instalar drivers Mesa otimizados
        if [ "${INSTALL_MESA_DRIVERS:-true}" = "true" ]; then
            echo "   Verificando drivers Mesa..."
            
            # Verificar se os pacotes já estão instalados (Debian 13: libgl1 + libglx-mesa0)
            if dpkg -l mesa-utils mesa-vulkan-drivers libgl1-mesa-dri libgl1 libglx-mesa0 libglu1-mesa >/dev/null 2>&1; then
                echo "✓ Drivers Mesa já estão instalados"
            else
                echo "   Instalando drivers Mesa otimizados..."
                apt_update
                apt_install mesa-utils mesa-vulkan-drivers libgl1-mesa-dri libgl1 libglx-mesa0 libglu1-mesa
                echo "✓ Drivers Mesa instalados"
            fi
        fi
        
        # Configurar performance do Mesa
        if [ "${CONFIGURE_MESA_PERFORMANCE:-true}" = "true" ]; then
            echo "   Configurando performance do Mesa..."
            
            add_to_bashrc "export MESA_GL_VERSION_OVERRIDE=4.5"
            add_to_bashrc "export MESA_GLSL_VERSION_OVERRIDE=450"
            add_to_bashrc "export MESA_GLES_VERSION_OVERRIDE=3.2"
            add_to_bashrc "export MESA_GL_THREAD=1"
            add_to_bashrc "export MESA_NO_ERROR=1"
            
            echo "✓ Mesa configurado para performance"
        fi
        
        # Otimizar GPU
        if [ "${OPTIMIZE_GPU_PERFORMANCE:-true}" = "true" ]; then
            echo "   Otimizando performance da GPU..."
            
            add_to_bashrc "export __GL_THREADED_OPTIMIZATIONS=1"
            add_to_bashrc "export __GL_SYNC_TO_VBLANK=0"
            add_to_bashrc "export __GL_YIELD=NOTHING"
            
            echo "✓ GPU otimizada para performance"
        fi
        
        # Configurar Wine para jogos
        if [ "${CONFIGURE_WINE_PERFORMANCE:-true}" = "true" ]; then
            echo "   Configurando Wine para jogos..."
            
            add_to_bashrc "export WINEDEBUG=-all"
            add_to_bashrc "export WINEDLLOVERRIDES=dxgi\\;d3d11\\;d3d10\\;d3d9"
            
            echo "✓ Wine configurado para performance"
        fi
        
        # Habilitar GameMode
        if [ "${ENABLE_GAMEMODE:-true}" = "true" ]; then
            if ! command -v gamemoderun &> /dev/null; then
                echo "   Habilitando GameMode..."
                apt_install gamemode libgamemode0
                echo "✓ GameMode instalado e habilitado"
            else
                echo "✓ GameMode ja instalado"
            fi
        fi
        
        # Configurar Steam
        if [ "${CONFIGURE_STEAM_PERFORMANCE:-true}" = "true" ]; then
            echo "   Configurando Steam para performance..."
            
            add_to_bashrc "export STEAM_COMPAT_CLIENT_INSTALL_PATH=\"$HOME/.steam/steam\""
            add_to_bashrc "export STEAM_COMPAT_DATA_PATH=\"$HOME/.steam/steam/steamapps/compatdata\""
            
            echo "✓ Steam configurado para performance"
        fi
        
        # Configurar Lutris
        if [ "${OPTIMIZE_LUTRIS_SETTINGS:-true}" = "true" ]; then
            echo "   Configurando Lutris..."
            
            add_to_bashrc "export LUTRIS_SKIP_INSTALLER_DLG=1"
            add_to_bashrc "export LUTRIS_ENABLE_RUNTIME=0"
            
            echo "✓ Lutris configurado"
        fi
        
        # Configurar DXVK
        if [ "${CONFIGURE_DXVK:-true}" = "true" ]; then
            echo "   Configurando DXVK..."
            
            add_to_bashrc "export DXVK_HUD=0"
            add_to_bashrc "export DXVK_LOG_LEVEL=none"
            add_to_bashrc "export DXVK_ASYNC=1"
            
            echo "✓ DXVK configurado"
        fi
        
        # Habilitar Vulkan
        if [ "${ENABLE_VULKAN:-true}" = "true" ]; then
            echo "   Verificando Vulkan..."
            
            # Verificar se os pacotes já estão instalados
            if dpkg -l vulkan-tools vulkan-validationlayers-dev vulkan-utility-libraries-dev >/dev/null 2>&1; then
                echo "✓ Vulkan já está instalado"
            else
                echo "   Habilitando Vulkan..."
                # shellcheck disable=SC1091
    # shellcheck source=/dev/null
    source /etc/os-release
                # Se for Debian 13 ou superior (ou Ubuntu muito recente), usa o novo pacote
                if [[ "$ID" == "debian" && "${VERSION_ID%%.*}" -ge 13 ]] || [[ "$ID" == "ubuntu" && "${VERSION_ID%%.*}" -ge 24 ]]; then
                    VULKAN_PKG="vulkan-utility-libraries-dev"
                else
                    # Retrocompatibilidade com Debian 12 e versões mais antigas
                    VULKAN_PKG="vulkan-validationlayers-dev"
                fi
                sudo apt-get install -y vulkan-tools "$VULKAN_PKG"
                echo "✓ Vulkan habilitado"
            fi
        fi
        
        # Configurar OpenGL
        if [ "${CONFIGURE_OPENGL:-true}" = "true" ]; then
            echo "   Configurando OpenGL..."
            
            add_to_bashrc "export __GL_SHADER_DISK_CACHE=1"
            add_to_bashrc "export __GL_SHADER_DISK_CACHE_PATH=\"$HOME/.cache/mesa_shader_cache\""
            
            echo "✓ OpenGL configurado"
        fi
        
        # Otimizar memória para jogos
        if [ "${OPTIMIZE_MEMORY_GAMING:-true}" = "true" ]; then
            echo "   Otimizando memória para jogos..."
            
            # Configurar memória para jogos
            echo 'vm.dirty_ratio=15' | sudo tee -a /etc/sysctl.conf
            echo 'vm.dirty_background_ratio=5' | sudo tee -a /etc/sysctl.conf
            echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
            
            echo "✓ Memória otimizada para jogos"
        fi
        
        # Desabilitar compositor durante jogos (KDE)
        if [ "${DISABLE_COMPOSITOR_GAMING:-true}" = "true" ]; then
            echo "   Configurando desabilitação do compositor durante jogos..."
            
            # Configurar KWin para desabilitar compositor durante jogos
            if command -v kwriteconfig5 &> /dev/null; then
                kwriteconfig5 --file kwinrc --group Compositing --key DisableTearingCheck true
                kwriteconfig5 --file kwinrc --group Compositing --key GLCore true
                echo "✓ Compositor configurado para jogos"
            else
                echo "⚠️  kwriteconfig5 não encontrado (KDE não detectado), pulando configuração do compositor"
            fi
        fi
        
        # Configurar mouse para jogos
        if [ "${CONFIGURE_GAMING_MOUSE:-true}" = "true" ]; then
            echo "   Configurando mouse para jogos..."
            
            add_to_bashrc "export MOUSE_DPI=800"
            add_to_bashrc "export MOUSE_POLLING_RATE=1000"
            
            echo "✓ Mouse configurado para jogos"
        fi
        
        # Configurar teclado para jogos
        if [ "${ENABLE_GAMING_KEYBOARD:-true}" = "true" ]; then
            echo "   Configurando teclado para jogos..."
            
            add_to_bashrc "export KEYBOARD_REPEAT_RATE=30"
            add_to_bashrc "export KEYBOARD_REPEAT_DELAY=250"
            
            echo "✓ Teclado configurado para jogos"
        fi
        
        echo "✓ Otimizações de jogos aplicadas com sucesso!"
    fi
}

# Função para limpar repositórios conflitantes
limpar_repositorios() {
    echo "🧹 Limpando repositórios conflitantes..."
    echo "========================================"
    
    # ============================================
    # ERRADICAÇÃO DO REPOSITÓRIO DO CURSOR
    # Remove qualquer vestígio do repositório zumbi do Cursor
    # ============================================
    sudo rm -f /etc/apt/sources.list.d/cursor.list
    sudo rm -f /etc/apt/sources.list.d/anysphere.list
    sudo rm -f /usr/share/keyrings/anysphere.gpg
    
    # ============================================
    # LIMPEZA PROFUNDA: Remove qualquer menção ao cursor.com de todos os .list
    # ============================================
    find /etc/apt/ -type f -name "*.list" -exec sed -i '/cursor\.com/d' {} + 2>/dev/null || true
    
    # Limpar TODOS os repositórios problemáticos (mais agressivo)
    echo "Removendo TODOS os repositórios conflitantes..."
    sudo rm -f /etc/apt/sources.list.d/vscode.list
    sudo rm -f /etc/apt/sources.list.d/google-chrome.list
    sudo rm -f /etc/apt/sources.list.d/google-chrome.sources
    sudo rm -f /etc/apt/sources.list.d/brave-browser-release.list
    sudo rm -f /etc/apt/sources.list.d/brave-browser-release.sources
    sudo rm -f /etc/apt/sources.list.d/spotify.list
    sudo rm -f /etc/apt/sources.list.d/spotify.sources
    sudo rm -f /etc/apt/sources.list.d/microsoft.list
    
    # Limpar chaves GPG de terceiros (preservando chaves do sistema)
    echo "Removendo chaves GPG de terceiros..."
    sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/google.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/brave-browser-archive-keyring.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/spotify.gpg
    # NÃO remover todas as chaves (preserva chaves do sistema como ubuntu-keyring)
    
    # Limpar chaves do keyrings de terceiros (preservando chaves do sistema)
    echo "Removendo chaves do keyrings de terceiros..."
    
    # Limpar cache do apt
    echo "Limpando cache do apt..."
    sudo apt clean
    sudo apt-get autoclean
    
    # Forçar atualização sem repositórios externos
    echo "Testando atualização básica..."
    apt_update --allow-releaseinfo-change || {
        echo "⚠️  Ainda há conflitos, limpando cache e tentando novamente..."
        # Preservar chaves do sistema, apenas limpar cache
        sudo apt clean
        sudo apt-get autoclean
        echo "Tentando novamente..."
        apt_update --allow-releaseinfo-change
    }
    
    echo "✅ Limpeza de repositórios concluída!"
}

echo -e "${BLUE}=========================================="
echo "Script de Instalação Automática - Debian/Ubuntu"
echo "==========================================${NC}"

# Verificar se está rodando como root
if [ "$EUID" -eq 0 ]; then
    echo -e "${YELLOW}⚠️  Executando como root. Algumas configurações podem não funcionar corretamente.${NC}"
fi

# ============================================
# Verificações Iniciais
# ============================================
load_config

# Verificar se apt-get existe
if ! command -v apt-get &> /dev/null; then
    echo -e "${RED}✗ Erro: apt-get não encontrado. Este script requer Debian/Ubuntu.${NC}"
    exit 1
fi

# ============================================
# CORREÇÃO CRÍTICA: Remover repositórios problemáticos ANTES do apt update
# Evita erro sqv no Debian 13 (Trixie)
# ============================================
echo "🧹 Preparando ambiente APT..."

# ============================================
# ERRADICAÇÃO DO REPOSITÓRIO DO CURSOR
# Remove qualquer vestígio do repositório zumbi do Cursor
# ============================================
rm -f /etc/apt/sources.list.d/cursor.list
rm -f /etc/apt/sources.list.d/anysphere.list
rm -f /usr/share/keyrings/anysphere.gpg 2>/dev/null || true
sudo rm -f /etc/apt/sources.list.d/cursor.list 2>/dev/null || true
sudo rm -f /etc/apt/sources.list.d/anysphere.list 2>/dev/null || true

# ============================================
# LIMPEZA PROFUNDA: Remove qualquer menção ao cursor.com de todos os .list
# ============================================
find /etc/apt/ -type f -name "*.list" -exec sed -i '/cursor\.com/d' {} + 2>/dev/null || true

sudo apt-get clean 2>/dev/null || true

# Executar limpeza de repositórios PRIMEIRO
limpar_repositorios

# Migrar fontes APT para novo formato (Ubuntu 26.04+)
if grep -q "ID=ubuntu" /etc/os-release 2>/dev/null && [ ! -f /etc/apt/sources.list.d/ubuntu.sources ]; then
    echo "   Criando fontes APT para Ubuntu..."
    UBUNTU_CODENAME=$(lsb_release -cs 2>/dev/null || grep -oP 'UBUNTU_CODENAME=\K.*' /etc/os-release)
    UBUNTU_CODENAME=${UBUNTU_CODENAME:-resolute}
    sudo tee /etc/apt/sources.list.d/ubuntu.sources > /dev/null <<-UBUNTU_EOF
Types: deb
URIs: http://archive.ubuntu.com/ubuntu/
Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security
Components: main universe restricted multiverse
Architectures: amd64
Signed-By: /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
UBUNTU_EOF
    # Restaurar chave do archive do Ubuntu se foi removida
    if [ ! -f /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg ]; then
        echo "   Restaurando chave GPG do Ubuntu..."
        gpg --keyserver keyserver.ubuntu.com --recv-keys 0x871920D1991BC93C 2>/dev/null
        gpg --export 0x871920D1991BC93C | sudo tee /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg > /dev/null
    fi
fi

# Atualizar sistema
echo "Atualizando sistema..."
apt_update && apt_upgrade
check_success "sistema"

# ============================================
# Instalação de dependências essenciais para Debian 13
# Atualizado: software-properties-common removido (desnecessário)
# Adicionado: python3-pip, nodejs, npm
# ============================================
echo "Instalando dependências essenciais..."
apt_install libfuse2

# ============================================
# Lógica condicional Fastfetch/Neofetch
# Fastfetch: Debian 13+ e Ubuntu 24.04+
# Neofetch: sistemas legados (Debian 11/12, Ubuntu 20.04/22.04)
# ============================================
# shellcheck disable=SC1091
source /etc/os-release
if [[ "$ID" == "debian" && "${VERSION_ID%%.*}" -ge 13 ]] || [[ "$ID" == "ubuntu" && "${VERSION_ID%%.*}" -ge 24 ]]; then
    if ! command -v fastfetch &> /dev/null; then
        echo "   Detectado sistema moderno: Instalando Fastfetch..."
        apt_install curl wget gnupg apt-transport-https ca-certificates fastfetch python3-pip
    else
        echo "✓ Fastfetch ja instalado"
    fi
else
    if ! command -v neofetch &> /dev/null; then
        echo "   Detectado sistema legado: Instalando Neofetch..."
        apt_install curl wget gnupg apt-transport-https ca-certificates neofetch python3-pip
    else
        echo "✓ Neofetch ja instalado"
    fi
fi
check_success "dependencias essenciais"

# Instalar Node.js e npm
echo "Instalando Node.js e npm..."
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    apt_install nodejs
fi
check_success "Node.js e npm"

# Instalar compiladores e ferramentas de desenvolvimento
if ! command -v gcc &> /dev/null || ! command -v git &> /dev/null; then
    echo "Instalando compiladores e ferramentas de desenvolvimento..."
    apt_install build-essential gcc g++ make cmake ninja-build git
else
    echo "✓ Compiladores e git ja instalados"
fi
check_success "compiladores"

# Instalar dependências de desenvolvimento
if ! dpkg -l libglib2.0-dev &>/dev/null; then
    echo "Instalando dependências de desenvolvimento..."
    apt_install libglib2.0-dev libcairo2-dev libssl-dev gtk-doc-tools

    echo "   Instalando libgusb-dev..."
    apt_install libgusb-dev || echo "⚠️  libgusb-dev nao encontrado, continuando..."

    echo "   Instalando libgirepository1.0-dev..."
    apt_install libgirepository1.0-dev || echo "⚠️  libgirepository1.0-dev nao encontrado, continuando..."

    echo "   Instalando libgudev-1.0-dev..."
    apt_install libgudev-1.0-dev || apt_install libudev-dev || echo "⚠️  libgudev nao encontrado, continuando..."
else
    echo "✓ Dependencias de desenvolvimento ja instaladas"
fi
check_success "dependencias de desenvolvimento"

# Instalar ferramentas adicionais úteis
if ! command -v htop &> /dev/null; then
    echo "Instalando ferramentas adicionais..."
    apt_install vim nano htop tree unzip tar file which pkg-config autoconf automake libtool
else
    echo "✓ Ferramentas adicionais ja instaladas"
fi
check_success "ferramentas adicionais"

# Instalar ferramentas divertidas e úteis
echo ""
echo "Instalando ferramentas divertidas e úteis..."
if [ "${INSTALL_FUN_TOOLS:-true}" = "true" ]; then
    if ! command -v fortune &> /dev/null || ! command -v cowsay &> /dev/null || ! command -v cmatrix &> /dev/null; then
    echo "   Instalando fortune, cowsay, cmatrix..."
    apt_install fortune-mod cowsay cmatrix
    
    # Instalar nyancat (disponível nos repositórios)
    if ! command -v nyancat &> /dev/null; then
        echo "   Instalando nyancat via apt..."
        if apt_install nyancat; then
            echo "✓ nyancat instalado via apt"
        else
            echo "⚠️  Falha ao instalar nyancat via apt"
            echo "   Você pode instalar manualmente: sudo apt install nyancat"
        fi
    else
        echo "✓ nyancat já está instalado"
    fi
    
    echo "✓ Ferramentas divertidas instaladas com sucesso"
    echo "   Para usar:"
    echo "   - fortune | cowsay"
    echo "   - cmatrix"
    echo "   - nyancat"
    check_success "ferramentas divertidas"
    else
        echo "✓ Ferramentas divertidas já estão instaladas"
    fi
else
    echo "⚠️  Instalação de ferramentas divertidas desabilitada no config.conf"
fi

# Instalar Docker e Docker Compose
echo "Instalando Docker e Docker Compose..."
if ! command -v docker &> /dev/null; then
    # Remover versões antigas
    apt_remove docker docker-engine docker.io containerd runc 2>/dev/null || true
    
    # Instalar dependências
    apt_install ca-certificates curl gnupg lsb-release
    
    source /etc/os-release
    if [[ "$ID" == "debian" ]]; then
        DOCKER_REPO="https://download.docker.com/linux/debian"
        DOCKER_GPG_URL="https://download.docker.com/linux/debian/gpg"
    else
        DOCKER_REPO="https://download.docker.com/linux/ubuntu"
        DOCKER_GPG_URL="https://download.docker.com/linux/ubuntu/gpg"
    fi

    # Adicionar chave GPG oficial do Docker
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL "$DOCKER_GPG_URL" | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    
    # Adicionar repositório do Docker
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] $DOCKER_REPO $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Atualizar lista de pacotes
    apt_update
    
    # Instalar Docker
    apt_install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    # Adicionar usuário ao grupo docker
    sudo usermod -aG docker "$USER"
    
    # Habilitar e iniciar serviço Docker
    sudo systemctl enable docker
    sudo systemctl start docker
    
    echo "✓ Docker instalado e configurado"
    echo "⚠️  IMPORTANTE: Faça logout e login novamente para usar Docker sem sudo"
else
    echo "✓ Docker já está instalado"
fi

# Verificar Docker Compose
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "⚠️  Docker Compose não encontrado, mas Docker Compose V2 (plugin) deve estar disponível"
    echo "   Use 'docker compose' em vez de 'docker-compose'"
else
    echo "✓ Docker Compose disponível"
fi
check_success "Docker e Docker Compose"

# Instalar yt-dlp (sucessor do youtube-dl)
echo "Instalando yt-dlp..."
if ! command -v yt-dlp &> /dev/null; then
    # Tentar instalar via pip primeiro (mais atualizado)
    if command -v pip3 &> /dev/null; then
        pip3 install --user yt-dlp --break-system-packages
        echo "✓ yt-dlp instalado via pip3"
    elif command -v pip &> /dev/null; then
        pip install --user yt-dlp --break-system-packages
        echo "✓ yt-dlp instalado via pip"
    else
        # Fallback para apt (pode estar desatualizado)
        apt_install yt-dlp
        echo "✓ yt-dlp instalado via apt"
    fi
else
    echo "✓ yt-dlp já está instalado"
fi
check_success "yt-dlp"

# Instalar Flatpak primeiro
echo "Instalando Flatpak..."
if ! command -v flatpak &> /dev/null; then
    apt_install flatpak
    echo "✓ Flatpak instalado"
else
    echo "✓ Flatpak já está instalado"
fi

if ! sudo flatpak remote-list | grep -q "flathub"; then
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    echo "✓ Repositório Flathub adicionado"
else
    echo "✓ Repositório Flathub já configurado"
fi
check_success "Flatpak"

# Instalar Snap
echo "Instalando Snap..."
if ! command -v snap &> /dev/null; then
    apt_install snapd
    echo "✓ Snap instalado"
else
    echo "✓ Snap já está instalado"
fi
check_success "Snap"

# Configurar repositórios adicionais
echo "Configurando repositórios adicionais..."

# VSCode - Instalar via Flatpak para evitar conflitos
echo "Configurando VSCode via Flatpak..."
if sudo flatpak list | grep -q "com.visualstudio.code"; then
    echo "✓ VSCode já está instalado via Flatpak"
else
    echo "Instalando VSCode via Flatpak..."
    sudo flatpak install --system -y flathub com.visualstudio.code
    check_success "VSCode (via Flatpak)"
fi

# Adicionar repositório do Google Chrome
echo "Configurando repositório do Google Chrome..."
if [ ! -f "/etc/apt/trusted.gpg.d/google.gpg" ]; then
    # Verificar se gpg está disponível
    if command -v gpg &> /dev/null; then
        wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/google.gpg > /dev/null
        echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
        echo "✓ Repositório Google Chrome configurado"
    else
        echo "⚠️  gpg não encontrado, tentando método alternativo..."
        if command -v apt-key &> /dev/null; then
            wget -qO- https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
            echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
            echo "✓ Repositório Google Chrome configurado (método alternativo)"
        else
            echo "⚠️  apt-key também não encontrado, configurando sem assinatura..."
            echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
            echo "✓ Repositório Google Chrome configurado (sem assinatura)"
        fi
    fi
else
    echo "✓ Repositório Google Chrome já existe"
fi

# Atualizar lista de pacotes
echo "Atualizando lista de pacotes..."

# ============================================
# O EXORCISMO FINAL DO CURSOR - Limpeza Absoluta do APT
# Remove tudo do sources.list.d relacionado ao Cursor ou Anysphere
# ============================================
sudo rm -f /etc/apt/sources.list.d/*cursor*
sudo rm -f /etc/apt/sources.list.d/*anysphere*
sudo rm -f /etc/apt/sources.list.d/cursor.list
sudo rm -f /etc/apt/sources.list.d/anysphere.list
sudo rm -f /etc/apt/sources.list.d/*cursor*
sudo rm -f /etc/apt/sources.list.d/*anysphere*
sudo rm -f /usr/share/keyrings/anysphere.gpg

apt_update || {
    echo "⚠️  Erro ao atualizar lista de pacotes, tentando corrigir..."
    apt_update --allow-releaseinfo-change
}


# Instalar programas principais
echo "Instalando programas principais..."

# AnyDesk
echo "Instalando AnyDesk..."
if command -v anydesk &> /dev/null; then
    echo "✓ AnyDesk já está instalado"
elif flatpak list --user 2>/dev/null | grep -q "com.anydesk.Anydesk"; then
    echo "✓ AnyDesk já está instalado (Flatpak)"
else
    echo "   Instalando via Flatpak..."
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
    if flatpak install --user -y flathub com.anydesk.Anydesk; then
        echo "✓ AnyDesk instalado via Flatpak"
        check_success "AnyDesk"
    else
        echo "⚠️  Falha ao instalar via Flatpak (servidor AnyDesk pode estar bloqueado)"
        echo "   Tente instalar manualmente de: https://anydesk.com/"
    fi
fi

# Spotify via Flatpak
echo "Instalando Spotify via Flatpak..."
# Verificar se Spotify já está instalado (múltiplas formas)
spotify_installed=false

# Verificar via flatpak (usuário)
if flatpak list --user 2>/dev/null | grep -q "com.spotify.Client"; then
    echo "✓ Spotify já está instalado (Flatpak - usuário)"
    spotify_installed=true
# Verificar via flatpak (sistema)
elif sudo flatpak list 2>/dev/null | grep -q "com.spotify.Client"; then
    echo "✓ Spotify já está instalado (Flatpak - sistema)"
    spotify_installed=true
# Verificar via apt (pacote nativo)
elif dpkg -l | grep -q "spotify-client" 2>/dev/null; then
    echo "✓ Spotify já está instalado (pacote nativo)"
    spotify_installed=true
# Verificar via snap
elif snap list 2>/dev/null | grep -q "spotify"; then
    echo "✓ Spotify já está instalado (Snap)"
    spotify_installed=true
# Verificar se o comando spotify existe no PATH
elif command -v spotify &> /dev/null; then
    echo "✓ Spotify já está instalado (encontrado no PATH)"
    spotify_installed=true
fi

if [ "$spotify_installed" = false ]; then
    echo "   Spotify não encontrado, instalando via Flatpak..."
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
    
    if flatpak install --user -y flathub com.spotify.Client; then
        echo "✓ Spotify instalado com sucesso"
        check_success "Spotify"
    else
        echo "✗ Erro ao instalar Spotify via Flatpak"
    fi
fi

# VSCode já foi instalado via Flatpak na seção anterior

# Cursor (Editor com IA)
echo "Instalando Cursor..."
cursor_found=false

# Verificar se o binário existe no PATH (instalação via .deb)
if command -v cursor &>/dev/null; then
    echo "✓ Cursor já está instalado (encontrado no PATH)"
    cursor_found=true
fi

# Verificar instalação manual (extraída do AppImage)
if [ "$cursor_found" = false ]; then
    if [ -f "$HOME/Applications/cursor/cursor" ]; then
        echo "✓ Cursor já está instalado (extraído em ~/Applications/cursor/)"
        cursor_found=true
        # Garantir permissões do sandbox
        if [ -f "$HOME/Applications/cursor/chrome-sandbox" ]; then
            CURRENT_PERMS=$(stat -c "%a" "$HOME/Applications/cursor/chrome-sandbox" 2>/dev/null)
            if [ "$CURRENT_PERMS" != "4755" ]; then
                echo "   Corrigindo permissões do sandbox..."
                sudo chown root "$HOME/Applications/cursor/chrome-sandbox" 2>/dev/null || true
                sudo chmod 4755 "$HOME/Applications/cursor/chrome-sandbox" 2>/dev/null || true
            fi
        fi
    fi
fi

# Verificar AppImage
if [ "$cursor_found" = false ]; then
    CURSOR_APPIMAGE=""
    if [ -f "$HOME/Applications/cursor.AppImage" ] && [ -s "$HOME/Applications/cursor.AppImage" ]; then
        CURSOR_APPIMAGE="$HOME/Applications/cursor.AppImage"
    elif [ -f "$HOME/Applications/Cursor.AppImage" ] && [ -s "$HOME/Applications/Cursor.AppImage" ]; then
        CURSOR_APPIMAGE="$HOME/Applications/Cursor.AppImage"
    else
        CURSOR_APPIMAGE=$(find "$HOME/Applications" -maxdepth 1 -name "*ursor*.AppImage" -type f 2>/dev/null | head -1)
    fi
    if [ -n "$CURSOR_APPIMAGE" ]; then
        echo "✓ Cursor AppImage encontrado. Extraindo e configurando..."
        cd "$HOME/Applications" || exit 1
        "$CURSOR_APPIMAGE" --appimage-extract > /dev/null 2>&1
        if [ -d squashfs-root ]; then
            rm -f "$CURSOR_APPIMAGE"
            mv squashfs-root cursor
            sudo chown root "$HOME/Applications/cursor/chrome-sandbox" 2>/dev/null || true
            sudo chmod 4755 "$HOME/Applications/cursor/chrome-sandbox" 2>/dev/null || true
            echo "✓ Cursor extraído e configurado em ~/Applications/cursor/"
            cursor_found=true
        fi
        cd "$OLDPWD" || true
    fi
fi

# Verificar se foi instalado via .deb (dpkg) e o binário existe
if [ "$cursor_found" = false ]; then
    if dpkg -l | grep -q "cursor" 2>/dev/null; then
        CURSOR_DEB_BIN=""
        for p in /usr/bin/cursor /usr/local/bin/cursor /opt/cursor/cursor; do
            if [ -f "$p" ] && [ -x "$p" ]; then
                CURSOR_DEB_BIN="$p"
                break
            fi
        done
        if [ -n "$CURSOR_DEB_BIN" ]; then
            echo "✓ Cursor já está instalado (pacote .deb)"
            cursor_found=true
        else
            echo "⚠️  Pacote .deb do Cursor está registrado, mas o binário não foi encontrado. Reinstalando..."
            sudo dpkg --purge cursor 2>/dev/null || sudo apt remove --purge -y cursor 2>/dev/null || true
        fi
    fi
fi

# Se não encontrou nenhuma instalação, tentar instalar
if [ "$cursor_found" = false ]; then
    echo "⚠️  Cursor não encontrado"
    echo "   Baixando e instalando via .deb oficial..."
    TMP_DEB=$(mktemp /tmp/cursor-XXXXXX.deb)
    if wget -O "$TMP_DEB" https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.7; then
        sudo dpkg -i "$TMP_DEB" || sudo apt install -f -y
        rm -f "$TMP_DEB"
        if command -v cursor &> /dev/null; then
            echo "✓ Cursor instalado com sucesso"
            echo "   Para usar: cursor"
        else
            echo "✗ Erro ao instalar o pacote .deb do Cursor"
        fi
    else
        echo "✗ Erro ao baixar o .deb do Cursor"
        echo "   Baixe manualmente de: https://cursor.sh/"
    fi
fi

# Google Chrome
echo "Instalando Google Chrome..."
chrome_installed=false

# Verificar via comando
if command -v google-chrome &> /dev/null; then
    echo "✓ Google Chrome já está instalado (comando encontrado)"
    chrome_installed=true
# Verificar via dpkg
elif dpkg -l | grep -q "google-chrome-stable" 2>/dev/null; then
    echo "✓ Google Chrome já está instalado (pacote nativo)"
    chrome_installed=true
# Verificar via flatpak
elif flatpak list --user 2>/dev/null | grep -q "com.google.Chrome" || sudo flatpak list 2>/dev/null | grep -q "com.google.Chrome"; then
    echo "✓ Google Chrome já está instalado (Flatpak)"
    chrome_installed=true
# Verificar via snap
elif snap list 2>/dev/null | grep -q "google-chrome"; then
    echo "✓ Google Chrome já está instalado (Snap)"
    chrome_installed=true
fi

if [ "$chrome_installed" = false ]; then
    echo "   Google Chrome não encontrado, instalando..."
    apt_install google-chrome-stable
    check_success "Google Chrome"
fi

# Brave Browser
echo "Instalando Brave Browser..."
brave_installed=false

# Verificar via comando
if command -v brave &> /dev/null || command -v brave-browser &> /dev/null; then
    echo "✓ Brave Browser já está instalado (comando encontrado)"
    brave_installed=true
# Verificar via dpkg
elif dpkg -l | grep -q "brave-browser" 2>/dev/null; then
    echo "✓ Brave Browser já está instalado (pacote nativo)"
    brave_installed=true
# Verificar via flatpak (usuário)
elif flatpak list --user 2>/dev/null | grep -q "com.brave.Browser"; then
    echo "✓ Brave Browser já está instalado (Flatpak - usuário)"
    brave_installed=true
# Verificar via flatpak (sistema)
elif sudo flatpak list 2>/dev/null | grep -q "com.brave.Browser"; then
    echo "✓ Brave Browser já está instalado (Flatpak - sistema)"
    brave_installed=true
# Verificar via snap
elif snap list 2>/dev/null | grep -q "brave"; then
    echo "✓ Brave Browser já está instalado (Snap)"
    brave_installed=true
fi

if [ "$brave_installed" = false ]; then
    echo "   Brave Browser não encontrado, tentando instalação via Flatpak..."
    
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
    
    if flatpak install --user -y flathub com.brave.Browser; then
        echo "✓ Brave Browser instalado via Flatpak"
    else
        echo "   Flatpak falhou, tentando download direto..."
        # Adicionar repositório do Brave
        curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        apt_update
        apt_install brave-browser
        check_success "Brave Browser"
    fi
fi

# Firefox
echo "Instalando Firefox..."
firefox_installed=false

# Verificar via comando
if command -v firefox &> /dev/null; then
    echo "✓ Firefox já está instalado (comando encontrado)"
    firefox_installed=true
# Verificar via dpkg
elif dpkg -l | grep -q "firefox" 2>/dev/null; then
    echo "✓ Firefox já está instalado (pacote nativo)"
    firefox_installed=true
# Verificar via flatpak
elif flatpak list --user 2>/dev/null | grep -q "org.mozilla.firefox" || sudo flatpak list 2>/dev/null | grep -q "org.mozilla.firefox"; then
    echo "✓ Firefox já está instalado (Flatpak)"
    firefox_installed=true
# Verificar via snap
elif snap list 2>/dev/null | grep -q "firefox"; then
    echo "✓ Firefox já está instalado (Snap)"
    firefox_installed=true
fi

if [ "$firefox_installed" = false ]; then
    echo "   Firefox não encontrado, instalando..."
    apt_install firefox
    check_success "Firefox"
fi

# Java (OpenJDK)
echo "Instalando Java (OpenJDK)..."
java_installed=false

# Verificar se Java já está instalado
if command -v java &> /dev/null; then
    echo "✓ Java já está instalado (comando encontrado)"
    java_installed=true
# Verificar via dpkg
elif dpkg -l | grep -q "openjdk" 2>/dev/null || dpkg -l | grep -q "default-jdk" 2>/dev/null; then
    echo "✓ Java já está instalado (pacote encontrado)"
    java_installed=true
fi

if [ "$java_installed" = false ]; then
    echo "   Java não encontrado, instalando..."
    # Tentar instalar OpenJDK 11 primeiro
    if apt_install openjdk-11-jdk openjdk-11-jre; then
        echo "✓ Java OpenJDK 11 instalado"
    else
        echo "⚠️  OpenJDK 11 não encontrado, tentando OpenJDK 17..."
        if apt_install openjdk-17-jdk openjdk-17-jre; then
            echo "✓ Java OpenJDK 17 instalado"
        else
            echo "⚠️  OpenJDK 17 não encontrado, tentando OpenJDK 21..."
            if apt_install openjdk-21-jdk openjdk-21-jre; then
                echo "✓ Java OpenJDK 21 instalado"
            elif apt_install openjdk-25-jdk openjdk-25-jre; then
                echo "✓ Java OpenJDK 25 instalado"
            else
                echo "⚠️  Nenhuma versão do OpenJDK encontrada, tentando instalação genérica..."
                apt_install default-jdk default-jre
                check_success "Java (default-jdk)"
            fi
        fi
    fi
fi

# Node.js
echo "Instalando Node.js..."
nodejs_installed=false

if command -v node &> /dev/null; then
    echo "✓ Node.js já está instalado (comando encontrado)"
    nodejs_installed=true
    
    if command -v npm &> /dev/null; then
        # Corrigir prefix do npm que causa erro em versões recentes
        fix_npm_prefix
        
        NPM_PREFIX=$(npm config get prefix 2>/dev/null || echo "$HOME/.npm-global")
        if [ "$NPM_PREFIX" != "/usr" ] && [ "$NPM_PREFIX" != "$HOME/.local" ]; then
            NPM_PREFIX_DISPLAY="${NPM_PREFIX#"$HOME"}"  # Remove /home/user do início
            NPM_PREFIX_DISPLAY="~${NPM_PREFIX_DISPLAY}"
            echo "   ⚠️ npm usa prefix personalizado: $NPM_PREFIX_DISPLAY"
            echo "   Isso pode causar conflitos com script npm install --global"
        fi
    fi
elif dpkg -l | grep -q "nodejs" 2>/dev/null; then
    echo "✓ Node.js já está instalado (pacote encontrado)"
    nodejs_installed=true
elif snap list 2>/dev/null | grep -q "node"; then
    echo "✓ Node.js já está instalado (Snap)"
    nodejs_installed=true
fi

if [ "$nodejs_installed" = false ]; then
    echo "   Node.js não encontrado, instalando..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    apt_install nodejs
    check_success "Node.js"
fi

# ============================================
# FERRAMENTAS DE IA (Novas na v1.1-stable)
# ============================================
echo ""
echo "=========================================="
echo "🤖 Instalando Ferramentas de IA"
echo "=========================================="
echo ""

# Garantir que python3-pip e python3-venv estão instalados (para Antigravity)
echo "Verificando Python e pip..."
if ! command -v pip3 &> /dev/null; then
    echo "   Instalando python3-pip e python3-venv..."
    apt_install python3-pip python3-venv
fi

# ============================================
# Antigravity - Ferramenta de hacking (Python/PIP)
# ============================================
echo "Instalando Antigravity (Google CLI)..."
if [ "${INSTALL_ANTIGRAVITY:-true}" = "true" ]; then
    if command -v antigravity &> /dev/null || [ -f "/usr/bin/antigravity" ]; then
        echo "✓ Antigravity já está instalado"
    else
        echo "   Adicionando repositório APT do Antigravity..."
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
        echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
        sudo apt update
        if sudo apt install -y antigravity; then
            echo "✓ Antigravity instalado com sucesso"
            echo "   Para usar: antigravity --help"
        else
            echo "⚠️  Falha ao instalar Antigravity"
        fi
    fi
else
    echo "⚠️ Instalação de Antigravity desabilitada no config.conf"
fi

# ============================================
# Claude Code - CLI da Anthropic (NPM Global)
# ============================================
echo "Instalando Claude Code..."
if [ "${INSTALL_CLAUDE_CODE:-true}" = "true" ]; then
    if command -v claude &> /dev/null; then
        echo "✓ Claude Code já está instalado"
    else
        # Garantir que npm está disponível
        if ! command -v npm &> /dev/null; then
            echo "   npm não encontrado, instalando Node.js..."
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            apt_install nodejs
        fi
        
        if command -v npm &> /dev/null; then
            echo "   Instalando Claude Code via npm (global)..."
            # Corrigir prefix do npm antes de instalar global
            fix_npm_prefix
            
            # ============================================
            # Forçar instalação global ignorando restrições de root do Debian
            # ============================================
            # Instalar sem tee para evitar erro de permissão no log
            npm install -g @anthropic-ai/claude-code --unsafe-perm=true --allow-root --force 2>/dev/null
            if command -v claude &> /dev/null; then
                echo "✓ Claude Code instalado com sucesso"
            else
                echo "   ⚠️ Tentando método alternativo com sudo..."
                sudo npm install -g @anthropic-ai/claude-code --unsafe-perm=true --allow-root --force 2>/dev/null
                if command -v claude &> /dev/null; then
                    echo "✓ Claude Code instalado com sucesso (via sudo)"
                else
                    echo "   ⚠️ Não foi possível instalar Claude Code"
                fi
            fi
        else
            echo "   ⚠️ npm não disponível. Claude Code requer Node.js/npm"
        fi
    fi
    if command -v claude &> /dev/null; then
        echo "✓ Claude Code instalado com sucesso"
        echo "   Para usar: claude --help"
    else
        echo "⚠️ Claude Code pode não ter sido instalado corretamente"
    fi
else
    echo "⚠️ Instalação de Claude Code desabilitada no config.conf"
fi

echo ""
echo "✓ Ferramentas de IA instaladas com sucesso!"

# Osu! (Jogo de ritmo)
echo "Instalando Osu!..."
USER_HOME=$(eval echo ~"$SUDO_USER" 2>/dev/null || echo "$HOME")
if ! sudo flatpak list | grep -q "com.github.ppy.osu" && [ ! -f "$USER_HOME/Applications/osu.AppImage" ]; then
    echo "⚠️  Osu! não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    if sudo flatpak install --system -y flathub com.github.ppy.osu; then
        echo "✓ Osu! instalado via Flatpak"
    else
        echo "   Flatpak falhou, tentando download direto..."
        if wget -O osu.AppImage https://github.com/ppy/osu/releases/latest/download/osu.AppImage; then
            chmod +x osu.AppImage
            USER_HOME=$(eval echo ~"$SUDO_USER" 2>/dev/null || echo "$HOME")
            mkdir -p "$USER_HOME/Applications"
            mv osu.AppImage "$USER_HOME/Applications/"
            echo "✓ Osu! AppImage baixado em $USER_HOME/Applications/"
            echo "   Para usar: $USER_HOME/Applications/osu.AppImage"
        else
            echo "✗ Erro ao baixar Osu!"
            echo "   Você pode baixar manualmente de: https://osu.ppy.sh/"
        fi
    fi
else
    echo "✓ Osu! já está instalado"
fi

# Steam (Plataforma de Jogos)
echo ""
echo "Instalando Steam..."
steam_installed=false

# Verificar se Steam já está instalado
if command -v steam &> /dev/null; then
    echo "✓ Steam já está instalado (comando encontrado)"
    steam_installed=true
# Verificar via dpkg
elif dpkg -l | grep -q "steam" 2>/dev/null; then
    echo "✓ Steam já está instalado (pacote encontrado)"
    steam_installed=true
# Verificar via flatpak
elif flatpak list --user 2>/dev/null | grep -q "com.valvesoftware.Steam" || sudo flatpak list 2>/dev/null | grep -q "com.valvesoftware.Steam"; then
    echo "✓ Steam já está instalado (Flatpak)"
    steam_installed=true
# Verificar via snap
elif snap list 2>/dev/null | grep -q "steam"; then
    echo "✓ Steam já está instalado (Snap)"
    steam_installed=true
fi

if [ "$steam_installed" = false ]; then
    echo "   Steam não encontrado, instalando..."
    if apt_install steam steam-installer; then
        echo "✓ Steam instalado com sucesso"
        echo "   Steam é a maior plataforma de distribuição de jogos para PC"
        echo "   Para melhor compatibilidade, instale os drivers gráficos apropriados"
    else
        echo "✗ Erro ao instalar Steam via apt, tentando Flatpak..."
        if sudo flatpak install --system -y flathub com.valvesoftware.Steam; then
            echo "✓ Steam instalado via Flatpak"
        else
            echo "✗ Erro ao instalar Steam"
        fi
    fi
fi
check_success "Steam"

# Lutris (Gerenciador de Jogos)
echo ""
echo "Instalando Lutris..."
lutris_installed=false

# Verificar se Lutris já está instalado
if command -v lutris &> /dev/null; then
    echo "✓ Lutris já está instalado (comando encontrado)"
    lutris_installed=true
# Verificar via dpkg
elif dpkg -l | grep -q "lutris" 2>/dev/null; then
    echo "✓ Lutris já está instalado (pacote encontrado)"
    lutris_installed=true
# Verificar via flatpak
elif flatpak list --user 2>/dev/null | grep -q "net.lutris.Lutris" || sudo flatpak list 2>/dev/null | grep -q "net.lutris.Lutris"; then
    echo "✓ Lutris já está instalado (Flatpak)"
    lutris_installed=true
# Verificar via snap
elif snap list 2>/dev/null | grep -q "lutris"; then
    echo "✓ Lutris já está instalado (Snap)"
    lutris_installed=true
fi

if [ "$lutris_installed" = false ]; then
    echo "   Lutris não encontrado, instalando..."
    if apt_install lutris; then
        echo "✓ Lutris instalado com sucesso"
        echo "   Lutris permite gerenciar jogos de várias plataformas (Steam, GOG, Epic, etc.)"
    else
        echo "✗ Erro ao instalar Lutris via apt, tentando Flatpak..."
        if sudo flatpak install --system -y flathub net.lutris.Lutris; then
            echo "✓ Lutris instalado via Flatpak"
        else
            echo "✗ Erro ao instalar Lutris"
        fi
    fi
fi
check_success "Lutris"

# Heroic Games Launcher (Epic Games & GOG)
echo ""
echo "Instalando Heroic Games Launcher..."
if command -v heroic &> /dev/null || flatpak list --user 2>/dev/null | grep -q "com.heroicgameslauncher.hgl"; then
    echo "✓ Heroic Games Launcher já está instalado"
else
    echo "   Instalando Heroic Games Launcher via Flatpak..."
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
    
    if flatpak install --user -y flathub com.heroicgameslauncher.hgl; then
        echo "✓ Heroic Games Launcher instalado com sucesso"
        echo "   Heroic permite jogar jogos da Epic Games Store e GOG no Linux"
    else
        echo "✗ Erro ao instalar Heroic Games Launcher"
    fi
fi
check_success "Heroic Games Launcher"

# FreeRDP (Dependência do WinBoat)
echo ""
echo "Instalando FreeRDP (dependência do WinBoat)..."
if command -v xfreerdp &> /dev/null; then
    echo "✓ FreeRDP já está instalado"
else
    # ============================================
    # FreeRDP via APT (evita travamento do Flatpak no Debian 13)
    # Debian 13 usa freerdp3-x11 (pacote atualizado)
    # ============================================
    echo "   Tentando instalar FreeRDP via repositório APT..."
    sudo apt-get install -y freerdp3-x11
    if dpkg -l | grep -q "^ii  freerdp3-x11"; then
        echo "   ✓ FreeRDP instalado via APT"
    else
        echo "   ⚠️ FreeRDP não pôde ser instalado via APT"
        echo "   Tentando versão alternativa..."
        sudo apt-get install -y freerdp2-x11 2>/dev/null || true
        if dpkg -l | grep -q "^ii  freerdp2-x11"; then
            echo "   ✓ FreeRDP2 instalado via APT"
        else
            echo "   WinBoat pode não funcionar corretamente sem FreeRDP"
        fi
    fi
fi
check_success "FreeRDP"

# WinBoat (Windows apps on Linux)
echo ""
echo "Instalando WinBoat..."
if command -v winboat &> /dev/null || [ -f "$HOME/Applications/WinBoat.AppImage" ]; then
    echo "✓ WinBoat já está instalado"
else
    echo "   WinBoat permite executar aplicativos Windows no Linux com integração perfeita"
    echo "   Baixando WinBoat AppImage..."
    mkdir -p "$HOME/Applications"
    
    # Detectar arquitetura
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        # Baixar a versão mais recente do WinBoat
        WINBOAT_URL="https://github.com/TibixDev/winboat/releases/download/v0.8.5/winboat-0.8.5-x86_64.AppImage"
        if wget --timeout=30 -O "$HOME/Applications/WinBoat.AppImage" "$WINBOAT_URL" 2>/dev/null && [ -s "$HOME/Applications/WinBoat.AppImage" ]; then
            chmod +x "$HOME/Applications/WinBoat.AppImage"
            
            # Criar desktop file para WinBoat
            echo "   Criando atalho do WinBoat..."
            mkdir -p ~/.local/share/applications ~/.local/share/icons
            
            cat > ~/.local/share/applications/winboat.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=WinBoat
Comment=Run Windows applications on Linux
Exec=$HOME/Applications/WinBoat.AppImage
Icon=winboat
Terminal=false
Categories=Utility;Emulator;
StartupNotify=true
MimeType=application/x-ms-dos-executable;application/x-msi;application/x-ms-shortcut;
EOF
            chmod +x ~/.local/share/applications/winboat.desktop
            
            # Criar ícone para WinBoat
            echo "   Criando ícone do WinBoat..."
            cat > ~/.local/share/icons/winboat.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
  <polyline points="9,22 9,12 15,12 15,22"/>
  <path d="M8 12h8"/>
  <path d="M8 16h8"/>
  <path d="M8 20h8"/>
</svg>
EOF
            
            # Atualizar base de dados
            update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
            gtk-update-icon-cache -f -t ~/.local/share/icons/ 2>/dev/null || true
            
            # Forçar atualização do menu (funciona em KDE e outros ambientes)
            echo "   Atualizando menu do sistema..."
            kbuildsycoca5 --noincremental 2>/dev/null || true
            
            echo "✓ WinBoat instalado com sucesso"
            echo "   Para usar: $HOME/Applications/WinBoat.AppImage"
            echo "   WinBoat executa aplicativos Windows nativamente no Linux"
            echo "   Suporta: Office, Adobe Suite, jogos, e muito mais"
            echo "   Atalho criado no menu de aplicações"
            echo "   💡 Se não aparecer no menu, faça logout/login ou reinicie o sistema"
            check_success "WinBoat"
        else
            # Remover arquivo incompleto se existir
            rm -f "$HOME/Applications/WinBoat.AppImage"
            echo "✗ Erro ao baixar WinBoat"
            echo "   Você pode baixar manualmente de: https://www.winboat.app/"
            echo "   Download: https://github.com/WinBoat-App/WinBoat/releases"
        fi
    else
        echo "⚠️  WinBoat AppImage não disponível para $ARCH"
        echo "   Visite https://www.winboat.app/ para mais informações"
    fi
fi

# Driver Oficial da Huion Tablet
echo ""
echo "Instalando Driver Oficial da Huion..."
if ! command -v huiontablet &> /dev/null && ! [ -f "/usr/lib/huiontablet/huiontablet" ]; then
    echo "   Instalando Driver Oficial da Huion..."
    
    # Obter o diretório do script
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    HUION_DIR="$SCRIPT_DIR/huion"
    
    # Verificar se os arquivos do driver existem
    if [ ! -d "$HUION_DIR" ]; then
        echo "✗ Arquivos do driver Huion não encontrados em $HUION_DIR"
        echo "   Os arquivos do driver devem estar em: debian/huion/"
        check_success "Driver Oficial da Huion"
    else
        # Fechar driver se estiver rodando
        AppName=huiontablet
        AppDir=huiontablet
        AppCoreName=huionCore
        AppUIName=huiontablet
        
        echo "   Parando driver existente (se estiver rodando)..."
        sudo killall huionCore 2>/dev/null || true
        sudo killall huiontablet 2>/dev/null || true
        
        # Copiar regras udev
        sysRuleDir="/usr/lib/udev/rules.d"
        appRuleDir="$HUION_DIR/huiontablet/res/rule"
        ruleName="20-huion.rules"
        
        echo "   Copiando regras udev..."
        if [ -f "$appRuleDir/$ruleName" ]; then
            sudo cp "$appRuleDir/$ruleName" "$sysRuleDir/$ruleName"
        else
            echo "✗ Não foi possível encontrar as regras do driver"
            check_success "Driver Oficial da Huion"
        fi
        
        # Instalar aplicativo
        sysAppDir="/usr/lib"
        appAppDir="$HUION_DIR/$AppName"
        exeShell="huionCore.sh"
        
        echo "   Copiando arquivos do driver..."
        if [ -d "$appAppDir" ]; then
            sudo cp -rf "$appAppDir" "$sysAppDir"
        else
            echo "✗ Não foi possível encontrar os arquivos do driver"
            check_success "Driver Oficial da Huion"
        fi
        
        # Configurar permissões
        echo "   Configurando permissões..."
        sudo chmod +0755 "$sysAppDir/$AppName/$exeShell" 2>/dev/null || true
        sudo chmod +0755 "$sysAppDir/$AppDir/$AppCoreName" 2>/dev/null || true
        sudo chmod +0755 "$sysAppDir/$AppDir/$AppUIName" 2>/dev/null || true
        sudo chmod 0766 "$sysAppDir/$AppDir/HuionCore.pid" 2>/dev/null || true
        sudo chmod 766 "$sysAppDir/$AppDir/log.conf" 2>/dev/null || true
        sudo chmod 766 "$sysAppDir/$AppDir/huion.log" 2>/dev/null || true
        
        # Instalar atalhos
        sysDesktopDir=/usr/share/applications
        sysAppIconDir=/usr/share/icons
        sysAutoStartDir=/etc/xdg/autostart
        
        appDesktopDir="$HUION_DIR/xdg/autostart/"
        appAppIconDir="$HUION_DIR/icon/"
        appAutoStartDir="$HUION_DIR/xdg/autostart/"
        
        appDesktopName=$AppName.desktop
        appIconName=$AppName.png
        
        echo "   Instalando atalhos..."
        if [ -f "$appDesktopDir/$appDesktopName" ]; then
            sudo cp "$appDesktopDir/$appDesktopName" "$sysDesktopDir/$appDesktopName"
        fi
        
        if [ -f "$appAppIconDir/$appIconName" ]; then
            sudo cp "$appAppIconDir/$appIconName" "$sysAppIconDir/$appIconName"
            sudo chmod 0766 "$sysAppIconDir/$appIconName"
        fi
        
        if [ -f "$appAutoStartDir/$appDesktopName" ]; then
            sudo cp "$appAutoStartDir/$appDesktopName" "$sysAutoStartDir/$appDesktopName"
        fi
        
        # Configurar arquivos de recursos
        echo "   Configurando recursos..."
        sudo chmod -R 766 "$sysAppDir/$AppDir/res/"* 2>/dev/null || true
        sudo chmod 766 "$sysAppDir/$AppDir/res/DevImg/"* 2>/dev/null || true
        sudo chmod -R 777 /usr/lib/huiontablet/res 2>/dev/null || true
        
        echo "✓ Driver Oficial da Huion instalado com sucesso"
        echo "   Para usar: procure 'Huion Tablet' no menu de aplicações"
        echo "   ⚠️  IMPORTANTE: Reinicie o sistema para o driver funcionar corretamente"
    fi
else
    echo "✓ Driver Oficial da Huion já está instalado"
fi
check_success "Driver Oficial da Huion"

# Função de desinstalação do Driver da Huion (se necessário)
uninstall_huion_driver() {
    echo "Desinstalando Driver Oficial da Huion..."
    
    # Fechar processos em execução
    echo "   Fechando processos do driver em execução..."
    sudo killall huionCore 2>/dev/null || true
    sudo killall huiontablet 2>/dev/null || true
    
    # Remover aplicação
    echo "   Removendo arquivos do driver..."
    if [ -d "/usr/lib/huiontablet" ]; then
        sudo rm -rf "/usr/lib/huiontablet"
    fi
    
    # Remover atalhos e ícones
    echo "   Removendo atalhos e ícones..."
    if [ -f "/usr/share/applications/huiontablet.desktop" ]; then
        sudo rm "/usr/share/applications/huiontablet.desktop"
    fi
    
    if [ -f "/usr/share/icons/huiontablet.png" ]; then
        sudo rm "/usr/share/icons/huiontablet.png"
    fi
    
    if [ -f "/etc/xdg/autostart/huiontablet.desktop" ]; then
        sudo rm "/etc/xdg/autostart/huiontablet.desktop"
    fi
    
    # Remover regras udev
    echo "   Removendo regras udev..."
    if [ -f "/usr/lib/udev/rules.d/20-huion.rules" ]; then
        sudo rm "/usr/lib/udev/rules.d/20-huion.rules"
    fi
    
    echo "✓ Driver Oficial da Huion desinstalado com sucesso"
}

# Nota sobre compatibilidade com jogos
echo ""
echo "Nota: Driver Oficial da Huion instalado para melhor compatibilidade com tablets Huion"
echo "   Para jogos como osu!, configure Raw Input: OFF nas configurações do jogo"

# WireGuard VPN
echo ""
echo "Instalando WireGuard..."
if command -v wg &> /dev/null || command -v wg-quick &> /dev/null; then
    echo "✓ WireGuard já está instalado"
else
    echo "   Instalando WireGuard..."
    if apt_install wireguard wireguard-tools; then
        echo "✓ WireGuard instalado com sucesso"
        echo "   WireGuard é uma VPN moderna, rápida e segura"
        echo "   Configuração: /etc/wireguard/"
        echo "   Para criar uma configuração: sudo wg genkey | tee privatekey | wg pubkey > publickey"
    else
        echo "✗ Erro ao instalar WireGuard"
    fi
fi
check_success "WireGuard"

# ====================================
# FERRAMENTAS DE SEGURANÇA (KALI LINUX)
# ====================================
echo ""
echo "=========================================="
echo "🔒 Instalando Ferramentas de Segurança"
echo "=========================================="
echo ""

# Nmap (Scanner de Rede)
echo "Instalando Nmap..."
if command -v nmap &> /dev/null; then
    echo "✓ Nmap já está instalado"
else
    apt_install nmap
    check_success "Nmap"
fi

# Wireshark (Análise de Pacotes)
echo "Instalando Wireshark..."
if command -v wireshark &> /dev/null; then
    echo "✓ Wireshark já está instalado"
else
    sudo DEBIAN_FRONTEND=noninteractive apt install -y wireshark
    # Adicionar usuário ao grupo wireshark
    sudo usermod -aG wireshark "$USER" 2>/dev/null || true
    echo "⚠️  IMPORTANTE: Faça logout e login novamente para usar Wireshark sem sudo"
    check_success "Wireshark"
fi

# John the Ripper (Quebra de Senhas)
echo "Instalando John the Ripper..."
if command -v john &> /dev/null; then
    echo "✓ John the Ripper já está instalado"
else
    apt_install john
    check_success "John the Ripper"
fi

# Hydra (Brute Force)
echo "Instalando Hydra..."
if command -v hydra &> /dev/null; then
    echo "✓ Hydra já está instalado"
else
    apt_install hydra
    check_success "Hydra"
fi

# Aircrack-ng (Segurança WiFi)
echo "Instalando Aircrack-ng..."
if command -v aircrack-ng &> /dev/null; then
    echo "✓ Aircrack-ng já está instalado"
else
    apt_install aircrack-ng
    check_success "Aircrack-ng"
fi

# SQLMap (SQL Injection)
echo "Instalando SQLMap..."
if command -v sqlmap &> /dev/null; then
    echo "✓ SQLMap já está instalado"
else
    # Instalar via pipx (melhor para ambientes gerenciados)
    if ! command -v pipx &> /dev/null; then
        apt_install pipx
        pipx ensurepath
    fi
    pipx install sqlmap
    echo "✓ SQLMap instalado via pipx"
    check_success "SQLMap"
fi

# Nikto (Scanner Web)
echo "Instalando Nikto..."
if command -v nikto &> /dev/null || [ -f "$HOME/.local/bin/nikto" ]; then
    echo "✓ Nikto já está instalado"
else
    # Tentar instalar via apt primeiro
    if apt_install nikto 2>/dev/null; then
        echo "✓ Nikto instalado via apt"
        check_success "Nikto"
    else
        # Se falhar, instalar via Git
        echo "   Instalando Nikto via Git..."
        if ! command -v git &> /dev/null; then
            apt_install git
        fi
        
        # Criar diretório local para binários se não existir
        mkdir -p "$HOME/.local/bin"
        
        # Clonar Nikto
        if git clone https://github.com/sullo/nikto.git /tmp/nikto-temp 2>/dev/null; then
            # Copiar para local apropriado
            mkdir -p "$HOME/.local/share/nikto"
            cp -r /tmp/nikto-temp/program/* "$HOME/.local/share/nikto/"
            
            # Criar link simbólico
            ln -sf "$HOME/.local/share/nikto/nikto.pl" "$HOME/.local/bin/nikto"
            chmod +x "$HOME/.local/bin/nikto"
            
            # Limpar
            rm -rf /tmp/nikto-temp
            
            echo "✓ Nikto instalado com sucesso"
            echo "   Para usar: nikto (certifique-se de que ~/.local/bin está no PATH)"
            
            # Adicionar ao PATH se não estiver
            if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
                echo "   Adicionando ~/.local/bin ao PATH..."
                add_to_bashrc "export PATH=\"$HOME/.local/bin:\$PATH\""
            fi
        else
            echo "✗ Erro ao instalar Nikto"
        fi
        check_success "Nikto"
    fi
fi

# Hashcat (Quebra de Hash)
echo "Instalando Hashcat..."
if command -v hashcat &> /dev/null; then
    echo "✓ Hashcat já está instalado"
else
    apt_install hashcat
    check_success "Hashcat"
fi

# Gobuster (Directory/DNS Bruteforce)
echo "Instalando Gobuster..."
if command -v gobuster &> /dev/null; then
    echo "✓ Gobuster já está instalado"
else
    # Instalar via Go
    if ! command -v go &> /dev/null; then
        apt_install golang-go
    fi
    go install github.com/OJ/gobuster/v3@latest
    echo "✓ Gobuster instalado via Go"
    echo "   Executável: ~/go/bin/gobuster"
    check_success "Gobuster"
fi

# ffuf (Fuzzing Web)
echo "Instalando ffuf..."
if command -v ffuf &> /dev/null; then
    echo "✓ ffuf já está instalado"
else
    # Instalar via Go
    if ! command -v go &> /dev/null; then
        apt_install golang-go
    fi
    go install github.com/ffuf/ffuf/v2@latest
    echo "✓ ffuf instalado via Go"
    echo "   Executável: ~/go/bin/ffuf"
    check_success "ffuf"
fi

echo ""
echo "✓ Ferramentas de Segurança instaladas com sucesso!"

# ====================================
# FERRAMENTAS DE OSINT
# ====================================
echo ""
echo "=========================================="
echo "🔍 Instalando Ferramentas de OSINT"
echo "=========================================="
echo ""

# Criar diretório para ferramentas OSINT
mkdir -p "$HOME/osint-tools"

# Sherlock (Busca de Username)
echo "Instalando Sherlock..."
if [ -d "$HOME/osint-tools/sherlock" ]; then
    echo "✓ Sherlock já está instalado"
else
    echo "   Clonando repositório do Sherlock..."
    git clone https://github.com/sherlock-project/sherlock.git "$HOME/osint-tools/sherlock"
    cd "$HOME/osint-tools/sherlock" || exit 1
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install .
    deactivate
    cat > "$HOME/osint-tools/sherlock/sherlock-run.sh" << 'EOF'
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/venv/bin/activate"
python "$SCRIPT_DIR/sherlock/sherlock.py" "$@"
deactivate
EOF
    chmod +x "$HOME/osint-tools/sherlock/sherlock-run.sh"
    echo "✓ Sherlock instalado com sucesso"
    echo "   Para usar: ~/osint-tools/sherlock/sherlock-run.sh <username>"
    cd - > /dev/null || true
    check_success "Sherlock"
fi

# theHarvester (Coleta de Emails)
echo "Instalando theHarvester..."
if [ -d "$HOME/osint-tools/theHarvester" ]; then
    echo "✓ theHarvester já está instalado"
else
    echo "   Clonando repositório do theHarvester..."
    git clone https://github.com/laramies/theHarvester.git "$HOME/osint-tools/theHarvester"
    cd "$HOME/osint-tools/theHarvester" || exit 1
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install .
    deactivate
    cat > "$HOME/osint-tools/theHarvester/theharvester-run.sh" << 'EOF'
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/venv/bin/activate"
python "$SCRIPT_DIR/theHarvester.py" "$@"
deactivate
EOF
    chmod +x "$HOME/osint-tools/theHarvester/theharvester-run.sh"
    echo "✓ theHarvester instalado com sucesso"
    echo "   Para usar: ~/osint-tools/theHarvester/theharvester-run.sh"
    cd - > /dev/null || true
    check_success "theHarvester"
fi

# Recon-ng (Framework de Reconhecimento)
echo "Instalando Recon-ng..."
if command -v recon-ng &> /dev/null || [ -d "$HOME/osint-tools/recon-ng" ]; then
    echo "✓ Recon-ng já está instalado"
else
    echo "   Clonando repositório do Recon-ng..."
    git clone https://github.com/lanmaster53/recon-ng.git "$HOME/osint-tools/recon-ng"
    cd "$HOME/osint-tools/recon-ng" || exit 1
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install -r REQUIREMENTS
    deactivate
    cat > "$HOME/osint-tools/recon-ng/recon-ng-run.sh" << 'EOF'
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/venv/bin/activate"
python "$SCRIPT_DIR/recon-ng" "$@"
deactivate
EOF
    chmod +x "$HOME/osint-tools/recon-ng/recon-ng-run.sh"
    echo "✓ Recon-ng instalado com sucesso"
    echo "   Para usar: ~/osint-tools/recon-ng/recon-ng-run.sh"
    cd - > /dev/null || true
    check_success "Recon-ng"
fi

# SpiderFoot (Automação OSINT)
echo "Instalando SpiderFoot..."
if [ -d "$HOME/osint-tools/spiderfoot" ]; then
    echo "✓ SpiderFoot já está instalado"
else
    PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    echo "   Versão do Python detectada: $PYTHON_VERSION"
    
    echo "   Instalando dependências de build para Python com C extensions..."
    apt_install build-essential libxml2-dev libxslt1-dev python3-dev
    
    echo "   Clonando repositório do SpiderFoot..."
    mkdir -p "$HOME/osint-tools"
    git clone https://github.com/smicallef/spiderfoot.git "$HOME/osint-tools/spiderfoot"
    cd "$HOME/osint-tools/spiderfoot" || exit 1
    
    echo "   Criando ambiente virtual..."
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install --upgrade pip setuptools wheel
    
    echo "   Instalando lxml (tratamento especial para Python 3.13+)..."
    if ! pip install --prefer-binary lxml 2>/dev/null; then
        echo "   Tentando instalar lxml com versão específica..."
        pip install lxml==5.2.2 || pip install lxml==5.1.0 || pip install lxml==5.0.0
    fi
    
    # Remover lxml do requirements.txt para evitar conflito de versão
    if [ -f requirements.txt ]; then
        sed -i '/^lxml/d' requirements.txt
    fi
    
    echo "   Instalando dependências do SpiderFoot..."
    if pip install -r requirements.txt 2>/dev/null; then
        deactivate
        
        cat > "$HOME/osint-tools/spiderfoot/spiderfoot-run.sh" << 'EOF'
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/venv/bin/activate"
python "$SCRIPT_DIR/sf.py" "$@"
deactivate
EOF
        chmod +x "$HOME/osint-tools/spiderfoot/spiderfoot-run.sh"
        echo "✓ SpiderFoot instalado com sucesso"
        echo "   Para usar: ~/osint-tools/spiderfoot/spiderfoot-run.sh -l 127.0.0.1:5001"
        check_success "SpiderFoot"
    else
        deactivate
        echo "✗ Erro ao instalar SpiderFoot"
        echo "   Removendo instalação incompleta..."
        rm -rf "$HOME/osint-tools/spiderfoot"
        echo "   Nota: Python $PYTHON_VERSION pode não ser compatível com SpiderFoot"
    fi
    cd - > /dev/null || true
fi

# GHunt (Google Account OSINT)
echo "Instalando GHunt..."
if command -v ghunt &> /dev/null; then
    echo "✓ GHunt já está instalado"
else
    echo "   Instalando GHunt via pipx..."
    if ! command -v pipx &> /dev/null; then
        apt_install pipx
        pipx ensurepath
    fi
    # Dependencias para Pillow (jpeg, zlib, freetype)
    apt_install libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev 2>/dev/null || true
    pipx install ghunt
    echo "✓ GHunt instalado com sucesso"
    echo "   Para usar: ghunt email <email>"
    check_success "GHunt"
fi

# PhoneInfoga (Phone Number OSINT)
echo "Instalando PhoneInfoga..."
if command -v phoneinfoga &> /dev/null || [ -f "$HOME/osint-tools/phoneinfoga/phoneinfoga" ]; then
    echo "✓ PhoneInfoga já está instalado"
else
    echo "   Baixando PhoneInfoga..."
    mkdir -p "$HOME/osint-tools/phoneinfoga"
    cd "$HOME/osint-tools/phoneinfoga" || exit 1
    
    # Detectar arquitetura
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        wget -O phoneinfoga.tar.gz https://github.com/sundowndev/phoneinfoga/releases/latest/download/phoneinfoga_Linux_x86_64.tar.gz
    else
        wget -O phoneinfoga.tar.gz https://github.com/sundowndev/phoneinfoga/releases/latest/download/phoneinfoga_Linux_arm64.tar.gz
    fi
    
    tar -xzf phoneinfoga.tar.gz
    chmod +x phoneinfoga
    rm phoneinfoga.tar.gz
    echo "✓ PhoneInfoga instalado com sucesso"
    echo "   Para usar: ~/osint-tools/phoneinfoga/phoneinfoga"
    cd - > /dev/null || true
    check_success "PhoneInfoga"
fi

# Maigret (Busca de Username Avançada)
echo "Instalando Maigret..."
if command -v maigret &> /dev/null; then
    echo "✓ Maigret já está instalado"
else
    echo "   Instalando Maigret via pipx..."
    if ! command -v pipx &> /dev/null; then
        apt_install pipx
        pipx ensurepath
    fi
    pipx install maigret
    echo "✓ Maigret instalado com sucesso"
    echo "   Para usar: maigret <username>"
    check_success "Maigret"
fi

# Holehe (Email OSINT)
echo "Instalando Holehe..."
if command -v holehe &> /dev/null; then
    echo "✓ Holehe já está instalado"
else
    echo "   Instalando Holehe via pipx..."
    if ! command -v pipx &> /dev/null; then
        apt_install pipx
        pipx ensurepath
    fi
    pipx install holehe
    echo "✓ Holehe instalado com sucesso"
    echo "   Para usar: holehe <email>"
    echo "   Holehe verifica se um email está registrado em mais de 120 sites"
    check_success "Holehe"
fi

echo ""
echo "✓ Ferramentas de OSINT instaladas com sucesso!"
echo ""
echo "📁 Ferramentas OSINT instaladas em: ~/osint-tools/"
echo ""

# Configurar Java
echo "Configurando Java..."
JAVA_PATH=$(sudo update-alternatives --list java | grep openjdk | head -n 1)
if [ -n "$JAVA_PATH" ]; then
    sudo update-alternatives --set java "$JAVA_PATH"
    echo "   ✓ Java configurado para: $JAVA_PATH"
else
    echo "   ⚠️ Nenhuma instalação do OpenJDK encontrada no update-alternatives."
fi

# Configurar Git
echo "Configurando Git com autenticação..."
if [ -n "$(git config --global user.name)" ] && [ -n "$(git config --global user.email)" ]; then
    echo "✓ Git já está configurado"
    echo "   Nome: $(git config --global user.name)"
    echo "   Email: $(git config --global user.email)"
    
    # Verificar chaves SSH
    if [ -f "$HOME/.ssh/id_rsa" ] || [ -f "$HOME/.ssh/id_ed25519" ]; then
        echo "✓ Chaves SSH já existem"
    else
        echo "⚠️  Chaves SSH não encontradas"
        echo "   Para configurar SSH, execute:"
        echo "   ssh-keygen -t ed25519 -C 'seu.email@exemplo.com'"
    fi
else
    echo "⚠️  Git não está configurado"
    echo "   Para configurar o Git, execute:"
    echo "   git config --global user.name 'Seu Nome'"
    echo "   git config --global user.email 'seu.email@exemplo.com'"
fi

# Correções para problemas comuns do KDE
echo ""
echo "=========================================="
echo "🔧 Aplicando correções para KDE"
echo "=========================================="
echo "Aplicando correções para problemas comuns do KDE..."

# Verificar se estamos no KDE
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$DESKTOP_SESSION" = "plasma" ]; then
    echo "   Detectado ambiente KDE, aplicando correções..."
    
    # Adicionar aliases para aplicativos Flatpak se necessário
    # Alias para Spotify
    if flatpak list --user 2>/dev/null | grep -q "com.spotify.Client"; then
        echo "   Configurando alias para Spotify..."
        if ! grep -q "alias spotify=" "$BASHRC" 2>/dev/null; then
            add_to_bashrc 'alias spotify="flatpak run com.spotify.Client"'
            echo "   ✓ Alias do Spotify adicionado"
        else
            echo "   ✓ Alias do Spotify já existe"
        fi
    fi
    
    # Alias para Brave Browser
    if flatpak list --user 2>/dev/null | grep -q "com.brave.Browser"; then
        echo "   Configurando alias para Brave Browser..."
        if ! grep -q "alias brave=" "$BASHRC" 2>/dev/null; then
            add_to_bashrc 'alias brave="flatpak run com.brave.Browser"'
            echo "   ✓ Alias do Brave Browser adicionado"
        else
            echo "   ✓ Alias do Brave Browser já existe"
        fi
    fi
    
    # Alias para Google Chrome
    if flatpak list --user 2>/dev/null | grep -q "com.google.Chrome"; then
        echo "   Configurando alias para Google Chrome..."
        if ! grep -q "alias google-chrome=" "$BASHRC" 2>/dev/null; then
            add_to_bashrc 'alias google-chrome="flatpak run com.google.Chrome"'
            echo "   ✓ Alias do Google Chrome adicionado"
        else
            echo "   ✓ Alias do Google Chrome já existe"
        fi
    fi
    
    # Adicionar variáveis Qt para corrigir problemas de tema
    echo "   Configurando variáveis Qt..."
    if ! grep -q "QT_QPA_PLATFORM" "$BASHRC" 2>/dev/null; then
        add_to_bashrc "export QT_QPA_PLATFORM=xcb"
        add_to_bashrc "export QT_AUTO_SCREEN_SCALE_FACTOR=0"
        add_to_bashrc "export QT_SCALE_FACTOR=1"
        echo "   ✓ Variáveis Qt configuradas"
    else
        echo "   ✓ Variáveis Qt já configuradas"
    fi
    
    # Configurar Flatpak para melhor compatibilidade
    echo "   Configurando Flatpak para KDE..."
    if command -v flatpak &> /dev/null; then
        # Reset configurações problemáticas
        flatpak override --reset com.spotify.Client 2>/dev/null || true
        flatpak override --reset com.google.Chrome 2>/dev/null || true
        flatpak override --reset com.brave.Browser 2>/dev/null || true
        
        # Adicionar permissões necessárias
        flatpak override --user --filesystem=home com.spotify.Client 2>/dev/null || true
        flatpak override --user --socket=wayland com.spotify.Client 2>/dev/null || true
        flatpak override --user --socket=x11 com.spotify.Client 2>/dev/null || true
        
        echo "   ✓ Configurações do Flatpak otimizadas para KDE"
    fi
    
    echo "✓ Correções do KDE aplicadas com sucesso"
    echo "   Para aplicar as mudanças, execute: source ~/.bashrc"
else
    echo "   Ambiente não-KDE detectado, pulando correções específicas"
fi

# Verificar instalações
echo "Verificando instalações..."
echo "Versão do Java:"
java -version 2>&1 | head -1

echo "Versão do Node.js:"
node --version 2>/dev/null || echo "Node.js não encontrado"

echo "Versão do npm:"
# Corrigir prefix do npm antes da verificação final
fix_npm_prefix
npm --version 2>/dev/null || echo "npm não encontrado"

echo "Versão do Git:"
git --version 2>/dev/null || echo "Git não encontrado"

# Instalar extensões úteis do VSCode
echo "Instalando extensões úteis do VSCode..."
if command -v code &> /dev/null && [ "$EUID" -ne 0 ]; then
    echo "   ⚠️  Esta operação pode demorar alguns minutos..."
    echo "   Pressione Ctrl+C para pular as extensões do VSCode"
    sleep 3
    echo "   Instalando extensões do VSCode..."
    
    # Instalar extensões com timeout para evitar travamento
    echo "   Instalando extensões com timeout de 30s cada..."
    
    if timeout 30 code --install-extension ms-python.python 2>/dev/null; then
        echo "   ✓ Python extension instalada"
    else
        echo "   ⚠️  Timeout ou erro ao instalar Python extension"
    fi
    
    if timeout 30 code --install-extension ms-vscode.cpptools 2>/dev/null; then
        echo "   ✓ C++ extension instalada"
    else
        echo "   ⚠️  Timeout ou erro ao instalar C++ extension"
    fi
    
    if timeout 30 code --install-extension redhat.vscode-yaml 2>/dev/null; then
        echo "   ✓ YAML extension instalada"
    else
        echo "   ⚠️  Timeout ou erro ao instalar YAML extension"
    fi
    
    echo "✓ Extensões do VSCode processadas"
else
    echo "⚠️  VSCode não encontrado ou executando como root"
fi

# Criar ícones para aplicativos
echo "Criando ícones para aplicativos..."
mkdir -p ~/.local/share/applications ~/.local/share/icons

# Criar arquivo desktop para Cursor (sempre atualizar se instalado)
CURSOR_EXEC=""
if command -v cursor &> /dev/null; then
    CURSOR_EXEC=$(command -v cursor)
elif [ -f "$HOME/Applications/cursor/cursor" ]; then
    CURSOR_EXEC="$HOME/Applications/cursor/cursor"
elif [ -f "$HOME/Applications/cursor.AppImage" ] && [ -s "$HOME/Applications/cursor.AppImage" ]; then
    CURSOR_EXEC="$HOME/Applications/cursor.AppImage --no-sandbox"
fi
if [ -n "$CURSOR_EXEC" ]; then
    rm -f ~/.local/share/applications/cursor.desktop
    cat > ~/.local/share/applications/cursor.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Cursor
Comment=AI-powered code editor
Exec=$CURSOR_EXEC
Icon=cursor
Terminal=false
Categories=Development;Utility;
StartupNotify=true
StartupWMClass=Cursor
MimeType=text/plain;
EOF
    chmod +x ~/.local/share/applications/cursor.desktop
    echo "✓ Ícone do Cursor criado"
fi

# Criar arquivo desktop para Osu! (caso AppImage, Flatpak já cria automático)
if [ -f "$HOME/Applications/osu.AppImage" ] && [ ! -f ~/.local/share/applications/osu.desktop ]; then
    cat > ~/.local/share/applications/osu.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=osu!
Comment=Rhythm game
Exec=$HOME/Applications/osu.AppImage
Icon=osu
Terminal=false
Categories=Game;
StartupNotify=true
EOF
    chmod +x ~/.local/share/applications/osu.desktop
    echo "✓ Ícone do Osu! criado"
fi

# Criar ícones SVG (fallback caso o .deb não forneça)
# Seguir padrão freedesktop.org: ~/.local/share/icons/<tema>/<tamanho>/apps/
mkdir -p ~/.local/share/icons/hicolor/scalable/apps

CREATE_CURSOR_ICON=false
if [ ! -f /usr/share/icons/hicolor/scalable/apps/cursor.svg ] && \
   [ ! -f ~/.local/share/icons/hicolor/scalable/apps/cursor.svg ] && \
   [ ! -f ~/.local/share/icons/cursor.svg ]; then
    CREATE_CURSOR_ICON=true
fi

if [ "$CREATE_CURSOR_ICON" = true ] || [ ! -f ~/.local/share/icons/hicolor/scalable/apps/cursor.svg ]; then
    cat > ~/.local/share/icons/hicolor/scalable/apps/cursor.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <rect width="64" height="64" rx="14" fill="#1a1a1a"/>
  <path d="M24 16 L24 44 L30 38 L36 44 L36 38 L24 16Z" fill="white"/>
</svg>
EOF
fi

# Também manter no local antigo para compatibilidade (se não existir)
if [ ! -f ~/.local/share/icons/cursor.svg ]; then
    cp ~/.local/share/icons/hicolor/scalable/apps/cursor.svg ~/.local/share/icons/cursor.svg 2>/dev/null || true
fi

if [ ! -f ~/.local/share/icons/hicolor/scalable/apps/osu.svg ] && [ ! -f ~/.local/share/icons/osu.svg ]; then
    cat > ~/.local/share/icons/hicolor/scalable/apps/osu.svg << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg width="256" height="256" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
  <circle cx="128" cy="128" r="120" fill="#FF69B4"/>
  <circle cx="128" cy="128" r="80" fill="#FFFFFF"/>
  <circle cx="128" cy="128" r="40" fill="#FF69B4"/>
</svg>
EOF
fi

if [ ! -f ~/.local/share/icons/osu.svg ]; then
    cp ~/.local/share/icons/hicolor/scalable/apps/osu.svg ~/.local/share/icons/osu.svg 2>/dev/null || true
fi

# Atualizar base de dados desktop (local e sistema)
update-desktop-database ~/.local/share/applications 2>/dev/null || true
sudo update-desktop-database /usr/share/applications 2>/dev/null || true
gtk-update-icon-cache -f -t ~/.local/share/icons/hicolor 2>/dev/null || true
echo "✓ Ícones criados e base de dados atualizada"

echo ""
echo -e "${GREEN}=========================================="
echo "Instalação Concluída com Sucesso! v1.1-stable"
echo "==========================================${NC}"
echo ""
echo "Programas instalados:"
echo "✓ AnyDesk, Spotify"
echo "✓ VSCode (Flatpak), ✓ Cursor (AI Code Editor)"
echo "✓ Google Chrome, Brave, Firefox"
echo "✓ Java (OpenJDK mais recente), Node.js, npm"
echo "✓ Docker e Docker Compose"
echo "✓ yt-dlp, Fastfetch/Neofetch"
echo ""
echo "🤖 Ferramentas de IA:"
echo "✓ Antigravity (Python IA CLI)"
echo "✓ Claude Code (Anthropic CLI)"
echo ""
echo "🎮 Plataformas de Jogos & Otimização:"
echo "✓ Osu!, Steam, Lutris, Heroic, WinBoat"
echo "✓ GameMode, DXVK, Vulkan (Utility Libraries)"
echo "✓ Otimização de GPU e Memória aplicada"
echo ""
echo "🔧 Ferramentas e Drivers:"
echo "✓ Driver Oficial da Huion (tablet)"
echo "✓ WireGuard (VPN)"
echo "✓ FreeRDP 3 (Protocolo RDP Moderno)"
echo "✓ Compiladores e ferramentas de desenvolvimento"
echo ""
echo "🔒 Segurança & OSINT:"
echo "✓ Full Suite: Nmap, Wireshark, John, Hydra"
echo "✓ Aircrack-ng, SQLMap, Nikto, Hashcat"
echo "✓ Gobuster, ffuf"
echo "✓ OSINT: SpiderFoot, Sherlock, theHarvester"
echo "✓ GHunt, PhoneInfoga, Maigret, Holehe"
echo ""

# Aplicar otimizações do KDE se estiver rodando KDE
if [ -n "$KDE_FULL_SESSION" ] || [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    optimize_kde
fi

# Aplicar otimizações do sistema
optimize_system

# Aplicar otimizações de jogos
optimize_gaming

echo "Recomendações:"
echo "1. Reinicie o sistema para garantir que todos os drivers funcionem corretamente"
echo "2. Configure o Git com suas credenciais"
echo "3. Teste os programas instalados"
echo "4. Os ícones do Cursor, Osu! e Huion Tablet aparecerão no menu após reiniciar o ambiente gráfico"
echo "5. Para usar Docker sem sudo, faça logout e login novamente"
echo "6. Configure o Driver Oficial da Huion para seu tablet gráfico (recomendado para osu!)"
echo ""
echo "Para testar o libfprint, execute: fprintd-enroll"
echo "Para usar Docker, execute: docker --version"
echo "Para usar Driver Oficial da Huion, procure 'Huion Tablet' no menu de aplicações"
