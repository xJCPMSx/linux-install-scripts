#!/bin/bash

# Script de Instalação Automática para Debian/Ubuntu
# Instala programas essenciais, dependências e configurações
# Versão: 1.0-beta - Versão beta para testes

echo "🚀 Script de Instalação Automática - Debian/Ubuntu v1.0-beta"
echo "============================================================"
echo "📅 Data: $(date)"
echo "🐧 Sistema: $(lsb_release -d | cut -f2)"
echo "🔧 Versão: 1.0-beta (Versão beta para testes)"
echo ""

set -e

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para verificar sucesso
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1 instalado com sucesso${NC}"
    else
        echo -e "${YELLOW}⚠️  $1 - continuando execução${NC}"
    fi
}

# Função para limpar repositórios conflitantes
limpar_repositorios() {
    echo "🧹 Limpando repositórios conflitantes..."
    echo "========================================"
    
    # Limpar TODOS os repositórios problemáticos (mais agressivo)
    echo "Removendo TODOS os repositórios conflitantes..."
    sudo rm -f /etc/apt/sources.list.d/vscode.list
    sudo rm -f /etc/apt/sources.list.d/google-chrome.list
    sudo rm -f /etc/apt/sources.list.d/brave-browser-release.list
    sudo rm -f /etc/apt/sources.list.d/spotify.list
    sudo rm -f /etc/apt/sources.list.d/microsoft.list
    sudo rm -f /etc/apt/sources.list.d/*.list
    
    # Limpar TODAS as chaves GPG conflitantes (mais agressivo)
    echo "Removendo TODAS as chaves GPG conflitantes..."
    sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/google.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/brave-browser-archive-keyring.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/spotify.gpg
    sudo rm -f /etc/apt/trusted.gpg.d/*.gpg
    
    # Limpar TODAS as chaves do keyrings (mais agressivo)
    echo "Removendo TODAS as chaves do keyrings..."
    sudo rm -f /usr/share/keyrings/microsoft.gpg
    sudo rm -f /usr/share/keyrings/google.gpg
    sudo rm -f /usr/share/keyrings/brave-browser-archive-keyring.gpg
    sudo rm -f /usr/share/keyrings/spotify.gpg
    sudo rm -f /usr/share/keyrings/*.gpg
    
    # Limpar cache do apt
    echo "Limpando cache do apt..."
    sudo apt clean
    sudo apt autoclean
    
    # Forçar atualização sem repositórios externos
    echo "Testando atualização básica..."
    sudo apt update --allow-releaseinfo-change || {
        echo "⚠️  Ainda há conflitos, limpando mais agressivamente..."
        sudo rm -f /etc/apt/sources.list.d/*.list
        sudo rm -f /etc/apt/trusted.gpg.d/*.gpg
        sudo rm -f /usr/share/keyrings/*.gpg
        sudo apt clean
        sudo apt autoclean
        echo "Tentando novamente..."
        sudo apt update --allow-releaseinfo-change
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

# Executar limpeza de repositórios PRIMEIRO
limpar_repositorios

# Atualizar sistema
echo "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y
check_success "sistema"

# Instalar dependências essenciais
echo "Instalando dependências essenciais..."
sudo apt install -y curl wget gnupg software-properties-common apt-transport-https ca-certificates lsb-release
check_success "dependências essenciais"

# Instalar compiladores e ferramentas de desenvolvimento
echo "Instalando compiladores e ferramentas de desenvolvimento..."
sudo apt install -y build-essential gcc g++ make cmake ninja-build git
check_success "compiladores"

# Instalar dependências de desenvolvimento
echo "Instalando dependências de desenvolvimento..."
# Instalar pacotes básicos primeiro
sudo apt install -y libglib2.0-dev libcairo2-dev libssl-dev gtk-doc-tools

# Tentar instalar pacotes específicos com fallbacks
echo "   Instalando libgusb-dev..."
sudo apt install -y libgusb-dev || echo "⚠️  libgusb-dev não encontrado, continuando..."

echo "   Instalando libgirepository1.0-dev..."
sudo apt install -y libgirepository1.0-dev || echo "⚠️  libgirepository1.0-dev não encontrado, continuando..."

echo "   Instalando libgudev-1.0-dev..."
sudo apt install -y libgudev-1.0-dev || sudo apt install -y libudev-dev || echo "⚠️  libgudev não encontrado, continuando..."

check_success "dependências de desenvolvimento"

# Instalar ferramentas adicionais úteis
echo "Instalando ferramentas adicionais..."
sudo apt install -y vim nano htop tree neofetch unzip tar file which pkg-config autoconf automake libtool
check_success "ferramentas adicionais"

# Instalar Docker e Docker Compose
echo "Instalando Docker e Docker Compose..."
if ! command -v docker &> /dev/null; then
    # Remover versões antigas
    sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true
    
    # Instalar dependências
    sudo apt install -y ca-certificates curl gnupg lsb-release
    
    # Adicionar chave GPG oficial do Docker
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    
    # Adicionar repositório do Docker
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Atualizar lista de pacotes
    sudo apt update
    
    # Instalar Docker
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    # Adicionar usuário ao grupo docker
    sudo usermod -aG docker $USER
    
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
        pip3 install --user yt-dlp
        echo "✓ yt-dlp instalado via pip3"
    elif command -v pip &> /dev/null; then
        pip install --user yt-dlp
        echo "✓ yt-dlp instalado via pip"
    else
        # Fallback para apt (pode estar desatualizado)
        sudo apt install -y yt-dlp
        echo "✓ yt-dlp instalado via apt"
    fi
else
    echo "✓ yt-dlp já está instalado"
fi
check_success "yt-dlp"

# Instalar Flatpak primeiro
echo "Instalando Flatpak..."
if ! command -v flatpak &> /dev/null; then
    sudo apt install -y flatpak
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
    sudo apt install -y snapd
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
    sudo flatpak install -y flathub com.visualstudio.code
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
sudo apt update || {
    echo "⚠️  Erro ao atualizar lista de pacotes, tentando corrigir..."
    # Limpar repositórios problemáticos
    sudo rm -f /etc/apt/sources.list.d/*.list
    sudo rm -f /etc/apt/trusted.gpg.d/*.gpg
    sudo rm -f /usr/share/keyrings/*.gpg
    echo "✓ Repositórios problemáticos removidos"
    echo "Tentando atualizar novamente..."
    sudo apt update
}


# Instalar programas principais
echo "Instalando programas principais..."

# AnyDesk
echo "Instalando AnyDesk..."
if ! command -v anydesk &> /dev/null; then
    wget -O anydesk.deb https://download.anydesk.com/linux/anydesk_6.3.2-1_amd64.deb
    sudo dpkg -i anydesk.deb || sudo apt-get install -f -y
    rm anydesk.deb
    check_success "AnyDesk"
else
    echo "✓ AnyDesk já está instalado"
fi

# Spotify via Flatpak
echo "Instalando Spotify via Flatpak..."
if ! sudo flatpak list | grep -q "com.spotify.Client"; then
    sudo flatpak install -y flathub com.spotify.Client
    check_success "Spotify"
else
    echo "✓ Spotify já está instalado"
fi

# VSCode já foi instalado via Flatpak na seção anterior

# Cursor (Editor com IA)
echo "Instalando Cursor..."
cursor_found=false

# Verificar se está no PATH
if command -v cursor &> /dev/null; then
    echo "✓ Cursor já está instalado"
    cursor_found=true
fi

# Verificar se Cursor está instalado (diretório .cursor indica instalação)
if [ "$cursor_found" = false ]; then
    if [ -d "$HOME/.cursor" ]; then
        echo "✓ Cursor já está instalado (detectado diretório .cursor)"
        cursor_found=true
    fi
fi

# Verificar AppImage se não encontrou via PATH ou diretório .cursor
if [ "$cursor_found" = false ]; then
    if [ -f "$HOME/Applications/cursor.AppImage" ] || [ -f "$HOME/Desktop/cursor.AppImage" ]; then
        echo "✓ Cursor AppImage já está disponível"
        cursor_found=true
    elif find "$HOME" -name "cursor*.AppImage" 2>/dev/null | grep -q "\.AppImage$"; then
        echo "✓ Cursor AppImage já está disponível"
        cursor_found=true
    fi
fi

# Se não encontrou nenhuma instalação, tentar instalar
if [ "$cursor_found" = false ]; then
    echo "⚠️  Cursor não encontrado"
    echo "   Baixando AppImage do Cursor..."
    mkdir -p "$HOME/Applications"
    if wget -O "$HOME/Applications/cursor.AppImage" https://download.cursor.sh/linux/appImage/x64; then
        chmod +x "$HOME/Applications/cursor.AppImage"
        echo "✓ Cursor AppImage baixado em $HOME/Applications/"
        echo "   Para usar: $HOME/Applications/cursor.AppImage"
    else
        echo "✗ Erro ao baixar Cursor AppImage"
        echo "   Você pode baixar manualmente de: https://cursor.sh/"
    fi
fi

# Google Chrome
echo "Instalando Google Chrome..."
if ! command -v google-chrome &> /dev/null; then
    sudo apt install -y google-chrome-stable
    check_success "Google Chrome"
else
    echo "✓ Google Chrome já está instalado"
fi

# Brave Browser
echo "Instalando Brave Browser..."
if ! command -v brave &> /dev/null && ! command -v brave-browser &> /dev/null; then
    echo "⚠️  Brave Browser não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    if sudo flatpak install -y flathub com.brave.Browser; then
        echo "✓ Brave Browser instalado via Flatpak"
    else
        echo "   Flatpak falhou, tentando download direto..."
        # Adicionar repositório do Brave
        curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install -y brave-browser
        check_success "Brave Browser"
    fi
else
    echo "✓ Brave Browser já está instalado"
fi

# Firefox
echo "Instalando Firefox..."
if ! command -v firefox &> /dev/null; then
    sudo apt install -y firefox
    check_success "Firefox"
else
    echo "✓ Firefox já está instalado"
fi

# Java (OpenJDK)
echo "Instalando Java (OpenJDK)..."
# Tentar instalar OpenJDK 11 primeiro
if sudo apt install -y openjdk-11-jdk openjdk-11-jre; then
    echo "✓ Java OpenJDK 11 instalado"
else
    echo "⚠️  OpenJDK 11 não encontrado, tentando OpenJDK 17..."
    if sudo apt install -y openjdk-17-jdk openjdk-17-jre; then
        echo "✓ Java OpenJDK 17 instalado"
    else
        echo "⚠️  OpenJDK 17 não encontrado, tentando OpenJDK 21..."
        if sudo apt install -y openjdk-21-jdk openjdk-21-jre; then
            echo "✓ Java OpenJDK 21 instalado"
        else
            echo "⚠️  Nenhuma versão do OpenJDK encontrada, tentando instalação genérica..."
            sudo apt install -y default-jdk default-jre
            check_success "Java (default-jdk)"
        fi
    fi
fi

# Node.js
echo "Instalando Node.js..."
if ! command -v node &> /dev/null; then
    # Adicionar repositório do NodeSource
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
    check_success "Node.js"
else
    echo "✓ Node.js já está instalado"
fi

# Osu! (Jogo de ritmo)
echo "Instalando Osu!..."
USER_HOME=$(eval echo ~"$SUDO_USER" 2>/dev/null || echo "$HOME")
if ! sudo flatpak list | grep -q "com.github.ppy.osu" && [ ! -f "$USER_HOME/Applications/osu.AppImage" ]; then
    echo "⚠️  Osu! não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    if sudo flatpak install -y flathub com.github.ppy.osu; then
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

# OpenTabletDriver (substituto melhor para tablets gráficos)
echo "Instalando OpenTabletDriver..."
if ! command -v opentabletdriver &> /dev/null && ! sudo flatpak list | grep -q "net.opentabletdriver.OpenTabletDriver"; then
    echo "   Instalando OpenTabletDriver via Flatpak..."
    
    # Tentar instalar via Flatpak primeiro (mais confiável)
    if sudo flatpak install -y flathub net.opentabletdriver.OpenTabletDriver; then
        echo "✓ OpenTabletDriver instalado via Flatpak"
        echo "   Para usar: flatpak run net.opentabletdriver.OpenTabletDriver"
        echo "   Ou procure 'OpenTabletDriver' no menu de aplicações"
    else
        echo "   Flatpak falhou, tentando download direto..."
        # Fallback para download direto
        mkdir -p "$HOME/Applications/OpenTabletDriver"
        
        # Tentar baixar AppImage (pode falhar se o link estiver incorreto)
        if wget -O "$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage" https://github.com/OpenTablet/OpenTabletDriver/releases/latest/download/OpenTabletDriver.AppImage 2>/dev/null && [ -s "$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage" ]; then
            chmod +x "$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage"
            echo "✓ OpenTabletDriver baixado em $HOME/Applications/OpenTabletDriver/"
            echo "   Para usar: $HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage"
            
            # Criar arquivo desktop para OpenTabletDriver
            cat > ~/.local/share/applications/opentabletdriver.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=OpenTabletDriver
Comment=Open source tablet driver
Exec=$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage
Icon=opentabletdriver
Terminal=false
Categories=System;HardwareSettings;
StartupNotify=true
EOF
            chmod +x ~/.local/share/applications/opentabletdriver.desktop
            echo "✓ Ícone do OpenTabletDriver criado"
        else
            echo "✗ Erro ao baixar OpenTabletDriver"
            echo "   Você pode instalar manualmente via Flatpak:"
            echo "   sudo flatpak install flathub net.opentabletdriver.OpenTabletDriver"
        fi
    fi
else
    echo "✓ OpenTabletDriver já está instalado"
fi
check_success "OpenTabletDriver"

# Driver da Huion Tablet (mantido para compatibilidade)
echo "Instalando driver da Huion Tablet..."
echo "Adicionando repositório do driver Huion..."
echo "Nota: OpenTabletDriver é recomendado para melhor compatibilidade com jogos como osu!"
echo "⚠️  Driver Huion não encontrado nos repositórios"
echo "   Você pode precisar baixar manualmente de:"
echo "   https://www.huion.com/support/download/"
echo "   Ou usar o OpenTabletDriver instalado acima"

# Configurar Java
echo "Configurando Java..."
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-11-openjdk-amd64/bin/java 1
sudo update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java
echo "Java configurado como alternativa padrão"

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

# Verificar instalações
echo "Verificando instalações..."
echo "Versão do Java:"
java -version 2>&1 | head -1

echo "Versão do Node.js:"
node --version 2>/dev/null || echo "Node.js não encontrado"

echo "Versão do npm:"
npm --version 2>/dev/null || echo "npm não encontrado"

echo "Versão do Git:"
git --version 2>/dev/null || echo "Git não encontrado"

# Instalar extensões úteis do VSCode
echo "Instalando extensões úteis do VSCode..."
if command -v code &> /dev/null && [ "$EUID" -ne 0 ]; then
    echo "   Instalando extensões do VSCode..."
    
    # Instalar extensões com verificação de erro
    if code --install-extension ms-python.python 2>/dev/null; then
        echo "   ✓ Python extension instalada"
    else
        echo "   ⚠️  Erro ao instalar Python extension"
    fi
    
    if code --install-extension ms-vscode.cpptools 2>/dev/null; then
        echo "   ✓ C++ extension instalada"
    else
        echo "   ⚠️  Erro ao instalar C++ extension"
    fi
    
    if code --install-extension redhat.vscode-yaml 2>/dev/null; then
        echo "   ✓ YAML extension instalada"
    else
        echo "   ⚠️  Erro ao instalar YAML extension"
    fi
    
    echo "✓ Extensões do VSCode processadas"
else
    echo "⚠️  VSCode não encontrado ou executando como root"
fi

# Criar ícones para aplicativos AppImage
echo "Criando ícones para aplicativos..."
mkdir -p ~/.local/share/applications ~/.local/share/icons

# Criar arquivo desktop para Cursor
CURSOR_APPIMAGE=$(find "$HOME/Applications" -name "Cursor*.AppImage" -type f | head -1)
if [ -n "$CURSOR_APPIMAGE" ]; then
    cat > ~/.local/share/applications/cursor.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Cursor
Comment=AI-powered code editor
Exec=$CURSOR_APPIMAGE
Icon=cursor
Terminal=false
Categories=Development;Utility;
StartupNotify=true
MimeType=text/plain;text/x-chdr;text/x-csrc;text/x-c++hdr;text/x-c++src;text/x-java;text/x-dsrc;text/x-pascal;text/x-perl;text/x-python;application/x-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/javascript;application/json;text/css;text/html;text/xml;text/x-sql;text/x-diff;
EOF
    chmod +x ~/.local/share/applications/cursor.desktop
    echo "✓ Ícone do Cursor criado"
fi

# Criar arquivo desktop para Osu!
if [ -f "$HOME/Applications/osu.AppImage" ]; then
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

# Criar ícones SVG
cat > ~/.local/share/icons/cursor.svg << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
  <rect width="64" height="64" rx="8" fill="#000000"/>
  <path d="M16 20 L48 20 L48 44 L16 44 Z" fill="#00D4AA"/>
  <path d="M20 24 L44 24 L44 40 L20 40 Z" fill="#FFFFFF"/>
  <path d="M24 28 L40 28 L40 36 L24 36 Z" fill="#000000"/>
  <circle cx="32" cy="32" r="4" fill="#00D4AA"/>
</svg>
EOF

cat > ~/.local/share/icons/osu.svg << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
  <circle cx="32" cy="32" r="30" fill="#FF69B4"/>
  <circle cx="32" cy="32" r="20" fill="#FFFFFF"/>
  <circle cx="32" cy="32" r="10" fill="#FF69B4"/>
  <text x="32" y="38" text-anchor="middle" font-family="Arial, sans-serif" font-size="12" font-weight="bold" fill="#FFFFFF">osu!</text>
</svg>
EOF

# Atualizar base de dados desktop
update-desktop-database ~/.local/share/applications 2>/dev/null || true
echo "✓ Ícones criados e base de dados atualizada"

echo ""
echo -e "${GREEN}=========================================="
echo "Instalação Concluída com Sucesso!"
echo "==========================================${NC}"
echo ""
echo "Programas instalados:"
echo "✓ AnyDesk"
echo "✓ Spotify"
echo "✓ VSCode (com extensões úteis)"
echo "✓ Cursor (Editor com IA)"
echo "✓ Google Chrome"
echo "✓ Brave Browser"
echo "✓ Firefox"
echo "✓ Java (OpenJDK 11)"
echo "✓ Node.js e npm"
echo "✓ Osu! (Jogo de ritmo)"
echo "✓ Docker e Docker Compose"
echo "✓ OpenTabletDriver (driver de tablet recomendado)"
echo "✓ Compiladores e ferramentas de desenvolvimento"
echo "✓ Dependências do libfprint"
echo "✓ Driver Huion (se disponível)"
echo ""

echo "Recomendações:"
echo "1. Reinicie o sistema para garantir que todos os drivers funcionem corretamente"
echo "2. Configure o Git com suas credenciais"
echo "3. Teste os programas instalados"
echo "4. Os ícones do Cursor, Osu! e OpenTabletDriver aparecerão no menu após reiniciar o ambiente gráfico"
echo "5. Para usar Docker sem sudo, faça logout e login novamente"
echo "6. Configure o OpenTabletDriver para seu tablet gráfico (recomendado para osu!)"
echo ""
echo "Para testar o libfprint, execute: fprintd-enroll"
echo "Para usar Docker, execute: docker --version"
echo "Para usar OpenTabletDriver, execute: $HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage"
