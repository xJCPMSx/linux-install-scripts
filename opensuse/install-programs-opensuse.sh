#!/bin/bash

# Script de instalação automática para openSUSE
# Instala programas essenciais, dependências e drivers
# Inclui: limpeza de repositórios, teste de disponibilidade e instalação completa
# Versão: 1.0-beta - Versão beta para testes

set -e

echo "🚀 Script de Instalação Automática - openSUSE v1.0-beta"
echo "======================================================"
echo "📅 Data: $(date)"
echo "🐧 Sistema: $(uname -s) $(uname -r)"
echo "🔧 Versão: 1.0-beta (Versão beta para testes)"
echo ""

# Função para verificar se o comando foi executado com sucesso
check_success() {
    if [ $? -eq 0 ]; then
        echo "✓ $1 instalado com sucesso"
    else
        echo "✗ Erro ao instalar $1"
        echo "   Continuando com os próximos programas..."
    fi
}

# Função para testar repositórios
test_repositories() {
    echo ""
    echo "=== Testando repositórios disponíveis ==="
    
    echo "VSCode:"
    if zypper search code 2>/dev/null | grep -q "code"; then
        echo "✓ VSCode disponível"
    else
        echo "✗ VSCode não encontrado"
    fi
    
    echo "Google Chrome:"
    if zypper search google-chrome 2>/dev/null | grep -q "google-chrome"; then
        echo "✓ Google Chrome disponível"
    else
        echo "✗ Google Chrome não encontrado"
    fi
    
    echo "Java:"
    if zypper search java-11-openjdk 2>/dev/null | grep -q "java-11-openjdk"; then
        echo "✓ Java disponível"
    else
        echo "✗ Java não encontrado"
    fi
    
    echo "Node.js:"
    if zypper search nodejs 2>/dev/null | grep -q "nodejs"; then
        echo "✓ Node.js disponível"
    else
        echo "✗ Node.js não encontrado"
    fi
    
    echo "Flatpak:"
    if command -v flatpak &> /dev/null; then
        echo "✓ Flatpak instalado"
    else
        echo "✗ Flatpak não instalado"
    fi
    
    echo ""
    echo "Teste de repositórios concluído!"
    echo ""
}

# Verificar argumentos da linha de comando
if [ "$1" = "--test" ] || [ "$1" = "-t" ]; then
    test_repositories
    exit 0
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Uso: $0 [opções]"
    echo ""
    echo "Opções:"
    echo "  --test, -t    Testar repositórios sem instalar"
    echo "  --help, -h    Mostrar esta ajuda"
    echo ""
    echo "Sem argumentos: Executa instalação completa"
    exit 0
fi

# Limpar repositórios problemáticos (se existirem)
echo "Limpando repositórios problemáticos..."
sudo zypper removerepo spotify 2>/dev/null || true
sudo zypper removerepo spotify-2 2>/dev/null || true

# Atualizar repositórios (já feito anteriormente)
echo "Repositórios já atualizados"
check_success "repositórios"

# Instalar compiladores e ferramentas (do setup-libfprint.sh)
echo ""
echo "Instalando compiladores e ferramentas essenciais..."
# Verificar se já estão instalados
if command -v gcc &> /dev/null && command -v git &> /dev/null; then
    echo "✓ Compiladores já estão instalados"
else
    sudo zypper install -y gcc gcc-c++ cmake ninja git meson
    check_success "compiladores e ferramentas"
fi

# Instalar dependências de desenvolvimento (do setup-libfprint.sh)
echo ""
echo "Instalando dependências de desenvolvimento..."
sudo zypper install -y \
  glib2-devel \
  libgusb-devel \
  gobject-introspection-devel \
  cairo-devel \
  libopenssl-devel \
  libgudev-1_0-devel \
  gtk-doc
check_success "dependências de desenvolvimento"

# Adicionar repositórios necessários
echo ""
echo "Adicionando repositórios adicionais..."

# Repositório para VSCode
echo "Adicionando repositório VSCode..."
if ! zypper repos | grep -q "vscode"; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo zypper addrepo --refresh https://packages.microsoft.com/yumrepos/vscode vscode
    echo "✓ Repositório VSCode adicionado"
else
    echo "✓ Repositório VSCode já existe"
fi

# Repositório para Google Chrome
echo "Adicionando repositório Google Chrome..."
if ! zypper repos | grep -q "google-chrome"; then
    # Adicionar chave GPG do Google Chrome
    sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
    sudo zypper addrepo --refresh https://dl.google.com/linux/chrome/rpm/stable/x86_64 google-chrome
    echo "✓ Repositório Google Chrome adicionado com chave GPG"
else
    echo "✓ Repositório Google Chrome já existe"
    # Verificar se a chave GPG está presente
    if ! rpm -qa | grep -q "gpg-pubkey-7fac5994-*"; then
        echo "   Adicionando chave GPG do Google Chrome..."
        sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
    fi
fi

# Repositório para Spotify (usando Flatpak como alternativa mais confiável)
echo "Configurando Spotify via Flatpak..."
if ! command -v flatpak &> /dev/null; then
    sudo zypper install -y flatpak
    echo "✓ Flatpak instalado"
else
    echo "✓ Flatpak já está instalado"
fi

if ! flatpak remote-list | grep -q "flathub"; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    echo "✓ Repositório Flathub adicionado"
else
    echo "✓ Repositório Flathub já existe"
fi

# Instalar Snap
echo "Instalando Snap..."
if ! command -v snap &> /dev/null; then
    echo "   Adicionando repositório Snappy..."
    sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed snappy
    sudo zypper refresh
    
    echo "   Instalando snapd..."
    sudo zypper install -y snapd
    
    echo "   Configurando serviços..."
    sudo systemctl enable --now snapd
    sudo systemctl enable --now snapd.apparmor
    
    echo "✓ Snap instalado e configurado"
else
    echo "✓ Snap já está instalado"
fi
check_success "Snap"

# Atualizar repositórios após adicionar novos
sudo zypper refresh

# Instalar programas principais
echo ""
echo "Instalando programas principais..."

# AnyDesk (verificar disponibilidade)
echo "Instalando AnyDesk..."
# Verificar se já está instalado
if command -v anydesk &> /dev/null; then
    echo "✓ AnyDesk já está instalado"
else
    if zypper search anydesk 2>/dev/null | grep -q "anydesk"; then
        sudo zypper install -y anydesk
        check_success "AnyDesk"
    else
        echo "⚠️  AnyDesk não encontrado nos repositórios"
        echo "   Instalando via download direto..."
        # Download e instalação manual do AnyDesk
        if wget -O anydesk.rpm https://download.anydesk.com/opensuse/anydesk-6.3.2-1.x86_64.rpm; then
            sudo zypper install -y anydesk.rpm
            rm anydesk.rpm
            check_success "AnyDesk (via download)"
        else
            echo "✗ Erro ao baixar AnyDesk"
            echo "   Você pode instalar manualmente de: https://anydesk.com/"
        fi
    fi
fi

# Spotify (via Flatpak)
echo "Instalando Spotify via Flatpak..."
if flatpak list --user 2>/dev/null | grep -q "com.spotify.Client"; then
    echo "✓ Spotify já está instalado"
else
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    
    flatpak install --user -y flathub com.spotify.Client
    check_success "Spotify"
fi

# VSCode
echo "Instalando VSCode..."
if command -v code &> /dev/null; then
    echo "✓ VSCode já está instalado"
else
    sudo zypper install -y code
    check_success "VSCode"
fi

# Cursor (Editor com IA)
echo "Instalando Cursor..."

# Verificar se já está instalado (pacote ou AppImage)
cursor_found=false

# Verificar AppImage primeiro (mais comum e não executa)
if [ -f "$HOME/Applications/cursor.AppImage" ] || [ -f "$HOME/Applications/Cursor.AppImage" ]; then
    echo "✓ Cursor AppImage já está disponível"
    cursor_found=true
elif find "$HOME/Applications" -maxdepth 1 -name "*ursor*.AppImage" 2>/dev/null | grep -q "\.AppImage$"; then
    echo "✓ Cursor AppImage já está disponível"
    cursor_found=true
fi

# Verificar se Cursor está instalado (diretório .cursor ou .config/Cursor indica instalação)
if [ "$cursor_found" = false ]; then
    if [ -d "$HOME/.cursor" ] || [ -d "$HOME/.config/Cursor" ]; then
        echo "✓ Cursor já está instalado (detectado diretório de configuração)"
        cursor_found=true
    fi
fi

# Verificar instalação manual
if [ "$cursor_found" = false ]; then
    if [ -f "/usr/local/bin/cursor" ] || [ -f "/opt/cursor/cursor" ]; then
        echo "✓ Cursor já está instalado (instalação manual)"
        cursor_found=true
    fi
fi

# Verificar se está no PATH (último recurso, usando type -P que não executa)
if [ "$cursor_found" = false ]; then
    if type -P cursor &>/dev/null; then
        echo "✓ Cursor já está instalado (encontrado no PATH)"
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
if command -v google-chrome &> /dev/null; then
    echo "✓ Google Chrome já está instalado"
else
    # Tentar instalar com verificação de assinatura
    if sudo zypper install -y google-chrome-stable; then
        check_success "Google Chrome"
    else
        echo "⚠️  Erro de assinatura GPG do Google Chrome"
        echo "   Tentando instalar ignorando verificação de assinatura..."
        if sudo zypper install --allow-unsigned-rpm -y google-chrome-stable; then
            echo "✓ Google Chrome instalado (ignorando verificação de assinatura)"
        else
            echo "✗ Erro ao instalar Google Chrome"
            echo "   Você pode instalar manualmente de: https://www.google.com/chrome/"
        fi
    fi
fi

# Brave Browser (verificar disponibilidade)
echo "Instalando Brave Browser..."
# Verificar se já está instalado
if command -v brave &> /dev/null || command -v brave-browser &> /dev/null || flatpak list --user 2>/dev/null | grep -q "com.brave.Browser"; then
    echo "✓ Brave Browser já está instalado"
else
    echo "⚠️  Brave Browser não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    
    # Tentar instalar via Flatpak primeiro
    if flatpak install --user -y flathub com.brave.Browser; then
        echo "✓ Brave Browser instalado via Flatpak"
    else
        echo "   Flatpak falhou, tentando download direto..."
        # Download e instalação manual do Brave (URL corrigida)
        if wget -O brave-browser.rpm https://brave-browser-rpm-release.s3.brave.com/brave-browser-stable.rpm; then
            sudo zypper install -y brave-browser.rpm
            rm brave-browser.rpm
            check_success "Brave Browser (via download)"
        else
            echo "✗ Erro ao baixar Brave Browser"
            echo "   Você pode instalar manualmente de: https://brave.com/"
        fi
    fi
fi

# Firefox (Navegador alternativo)
echo "Instalando Firefox..."
# Verificar se já está instalado
if command -v firefox &> /dev/null || flatpak list --user 2>/dev/null | grep -i "firefox" | grep -q "org.mozilla.firefox"; then
    echo "✓ Firefox já está instalado"
else
    echo "⚠️  Firefox não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    
    # Tentar instalar via Flatpak primeiro
    if flatpak install --user -y flathub org.mozilla.firefox; then
        echo "✓ Firefox instalado via Flatpak"
    else
        echo "   Flatpak falhou, tentando instalação via zypper..."
        # Instalação via zypper
        sudo zypper install -y MozillaFirefox
        check_success "Firefox"
    fi
fi

# Java (OpenJDK)
echo "Instalando Java (OpenJDK)..."
if command -v java &> /dev/null; then
    echo "✓ Java já está instalado"
else
    sudo zypper install -y java-11-openjdk java-11-openjdk-devel
    check_success "Java"
fi

# Node.js
echo "Instalando Node.js..."
if command -v node &> /dev/null; then
    echo "✓ Node.js já está instalado"
else
    sudo zypper install -y nodejs npm
    check_success "Node.js"
fi

# Instalar dependências adicionais úteis
echo ""
echo "Instalando dependências adicionais úteis..."
# Verificar se já estão instaladas
if command -v wget &> /dev/null && command -v make &> /dev/null && command -v curl &> /dev/null; then
    echo "✓ Dependências adicionais já estão instaladas"
else
    sudo zypper install -y \
      curl \
      wget \
      unzip \
      tar \
      vim \
      nano \
      htop \
      neofetch \
      tree \
      file \
      which \
      make \
      autoconf \
      automake \
      libtool \
      pkg-config
    check_success "dependências adicionais"
fi

# Instalar ferramentas divertidas e úteis
echo ""
echo "Instalando ferramentas divertidas e úteis..."
if ! command -v fortune &> /dev/null || ! command -v cowsay &> /dev/null || ! command -v cmatrix &> /dev/null; then
    echo "   Instalando fortune, cowsay, cmatrix..."
    sudo zypper install -y fortune cowsay cmatrix
    
    # Instalar nyancat (não disponível nos repos, instalar via cargo)
    if ! command -v nyancat &> /dev/null; then
        echo "   Instalando nyancat via cargo..."
        if ! command -v cargo &> /dev/null; then
            echo "   Cargo não encontrado, instalando Rust..."
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
            # shellcheck source=/dev/null
            source ~/.cargo/env
        fi
        
        # Tentar instalar nyancat via cargo
        if cargo install nyancat; then
            echo "✓ nyancat instalado via cargo"
        else
            echo "⚠️  Falha ao instalar nyancat via cargo"
            echo "   Você pode instalar manualmente mais tarde"
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

# Instalar Docker e Docker Compose
echo "Instalando Docker e Docker Compose..."
if ! command -v docker &> /dev/null; then
    # Remover repositórios Docker problemáticos primeiro
    echo "🧹 Limpando repositórios Docker problemáticos..."
    sudo zypper removerepo docker-ce 2>/dev/null || true
    sudo zypper removerepo docker-community 2>/dev/null || true
    sudo zypper removerepo docker 2>/dev/null || true
    
    # Atualizar repositórios após limpeza
    echo "🔄 Atualizando repositórios após limpeza..."
    sudo zypper refresh
    
    # Remover versões antigas
    sudo zypper remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true
    
    # Instalar dependências
    sudo zypper install -y curl ca-certificates
    
    # Instalar Docker via pacotes do sistema (mais confiável para Tumbleweed)
    echo "📦 Instalando Docker via pacotes do sistema..."
    sudo zypper install -y docker docker-compose
    
    # Adicionar usuário ao grupo docker
    sudo usermod -aG docker "$USER"
    
    # Habilitar e iniciar serviço Docker
    sudo systemctl enable docker
    sudo systemctl start docker
    
    echo "✓ Docker instalado e configurado via pacotes do sistema"
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
        # Fallback para zypper
        sudo zypper install -y yt-dlp
        echo "✓ yt-dlp instalado via zypper"
    fi
else
    echo "✓ yt-dlp já está instalado"
fi
check_success "yt-dlp"

# Osu! (Jogo de ritmo)
echo ""
echo "Instalando Osu!..."
# Verificar se já está instalado
USER_HOME=$(eval echo ~"$SUDO_USER" 2>/dev/null || echo "$HOME")
if command -v osu &> /dev/null || command -v osu! &> /dev/null || [ -f "$USER_HOME/Applications/osu.AppImage" ] || flatpak list --user 2>/dev/null | grep -i "osu" | grep -q "com.github.ppy.osu"; then
    echo "✓ Osu! já está instalado"
else
    echo "⚠️  Osu! não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    # Garantir que flathub está configurado para o usuário
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    
    # Tentar instalar via Flatpak primeiro
    if flatpak install --user -y flathub com.github.ppy.osu; then
        echo "✓ Osu! instalado via Flatpak"
    else
        echo "   Flatpak falhou, tentando download direto..."
        # Download e instalação manual do Osu!
        if wget -O osu.AppImage https://github.com/ppy/osu/releases/latest/download/osu.AppImage; then
            chmod +x osu.AppImage
            # Usar diretório do usuário atual, não root
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
fi

# Steam (Plataforma de Jogos)
echo ""
echo "Instalando Steam..."
if command -v steam &> /dev/null || flatpak list --user 2>/dev/null | grep -i "steam" | grep -q "com.valvesoftware.Steam"; then
    echo "✓ Steam já está instalado"
else
    echo "   Instalando Steam..."
    if sudo zypper install -y steam; then
        echo "✓ Steam instalado com sucesso"
        echo "   Steam é a maior plataforma de distribuição de jogos para PC"
        echo "   Para melhor compatibilidade, instale os drivers gráficos apropriados"
    else
        echo "✗ Erro ao instalar Steam via zypper, tentando Flatpak..."
        
        # Garantir que flathub está configurado para o usuário
        flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
        
        if flatpak install --user -y flathub com.valvesoftware.Steam; then
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
if command -v lutris &> /dev/null || flatpak list --user 2>/dev/null | grep -i "lutris" | grep -q "net.lutris.Lutris"; then
    echo "✓ Lutris já está instalado"
else
    echo "   Instalando Lutris..."
    if sudo zypper install -y lutris; then
        echo "✓ Lutris instalado com sucesso"
        echo "   Lutris permite gerenciar jogos de várias plataformas (Steam, GOG, Epic, etc.)"
    else
        echo "✗ Erro ao instalar Lutris via zypper, tentando Flatpak..."
        
        # Garantir que flathub está configurado para o usuário
        flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
        
        if flatpak install --user -y flathub net.lutris.Lutris; then
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
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    
    if flatpak install --user -y flathub com.heroicgameslauncher.hgl; then
        echo "✓ Heroic Games Launcher instalado com sucesso"
        echo "   Heroic permite jogar jogos da Epic Games Store e GOG no Linux"
        echo "   Para iniciar: flatpak run com.heroicgameslauncher.hgl"
    else
        echo "✗ Erro ao instalar Heroic Games Launcher"
    fi
fi
check_success "Heroic Games Launcher"

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
        WINBOAT_URL="https://github.com/WinBoat-App/WinBoat/releases/latest/download/WinBoat-x86_64.AppImage"
        if wget --timeout=30 -O "$HOME/Applications/WinBoat.AppImage" "$WINBOAT_URL" 2>/dev/null && [ -s "$HOME/Applications/WinBoat.AppImage" ]; then
            chmod +x "$HOME/Applications/WinBoat.AppImage"
            echo "✓ WinBoat instalado com sucesso"
            echo "   Para usar: $HOME/Applications/WinBoat.AppImage"
            echo "   WinBoat executa aplicativos Windows nativamente no Linux"
            echo "   Suporta: Office, Adobe Suite, jogos, e muito mais"
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
        echo "   Os arquivos do driver devem estar em: opensuse/huion/"
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
    if sudo zypper install -y wireguard-tools; then
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
    sudo zypper install -y nmap
    check_success "Nmap"
fi

# Wireshark (Análise de Pacotes)
echo "Instalando Wireshark..."
if command -v wireshark &> /dev/null; then
    echo "✓ Wireshark já está instalado"
else
    sudo zypper install -y wireshark
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
    sudo zypper install -y john
    check_success "John the Ripper"
fi

# Hydra (Brute Force)
echo "Instalando Hydra..."
if command -v hydra &> /dev/null; then
    echo "✓ Hydra já está instalado"
else
    sudo zypper install -y hydra
    check_success "Hydra"
fi

# Aircrack-ng (Segurança WiFi)
echo "Instalando Aircrack-ng..."
if command -v aircrack-ng &> /dev/null; then
    echo "✓ Aircrack-ng já está instalado"
else
    sudo zypper install -y aircrack-ng
    check_success "Aircrack-ng"
fi

# SQLMap (SQL Injection)
echo "Instalando SQLMap..."
if command -v sqlmap &> /dev/null; then
    echo "✓ SQLMap já está instalado"
else
    # Instalar via pipx (melhor para ambientes gerenciados)
    if ! command -v pipx &> /dev/null; then
        sudo zypper install -y python3-pipx
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
    # Nikto não está disponível nos repos do openSUSE, instalar via Git
    echo "   Instalando Nikto via Git..."
    if ! command -v git &> /dev/null; then
        sudo zypper install -y git
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
            echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$HOME/.bashrc"
        fi
    else
        echo "✗ Erro ao instalar Nikto"
    fi
    check_success "Nikto"
fi

# Hashcat (Quebra de Hash)
echo "Instalando Hashcat..."
if command -v hashcat &> /dev/null; then
    echo "✓ Hashcat já está instalado"
else
    sudo zypper install -y hashcat
    check_success "Hashcat"
fi

# Gobuster (Directory/DNS Bruteforce)
echo "Instalando Gobuster..."
if command -v gobuster &> /dev/null; then
    echo "✓ Gobuster já está instalado"
else
    # Instalar via Go
    if ! command -v go &> /dev/null; then
        sudo zypper install -y go
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
        sudo zypper install -y go
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
    cd "$HOME/osint-tools/sherlock"
    
    # Criar ambiente virtual
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install .
    deactivate
    
    # Criar script wrapper
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
    cd - > /dev/null
    check_success "Sherlock"
fi

# theHarvester (Coleta de Emails)
echo "Instalando theHarvester..."
if [ -d "$HOME/osint-tools/theHarvester" ]; then
    echo "✓ theHarvester já está instalado"
else
    echo "   Clonando repositório do theHarvester..."
    git clone https://github.com/laramies/theHarvester.git "$HOME/osint-tools/theHarvester"
    cd "$HOME/osint-tools/theHarvester"
    
    # Criar ambiente virtual
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install .
    deactivate
    
    # Criar script wrapper
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
    cd - > /dev/null
    check_success "theHarvester"
fi

# Recon-ng (Framework de Reconhecimento)
echo "Instalando Recon-ng..."
if command -v recon-ng &> /dev/null || [ -d "$HOME/osint-tools/recon-ng" ]; then
    echo "✓ Recon-ng já está instalado"
else
    echo "   Clonando repositório do Recon-ng..."
    git clone https://github.com/lanmaster53/recon-ng.git "$HOME/osint-tools/recon-ng"
    cd "$HOME/osint-tools/recon-ng"
    
    # Criar ambiente virtual
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install -r REQUIREMENTS
    deactivate
    
    # Criar script wrapper
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
    cd - > /dev/null
    check_success "Recon-ng"
fi

# SpiderFoot (Automação OSINT)
echo "Instalando SpiderFoot..."
if [ -d "$HOME/osint-tools/spiderfoot" ]; then
    echo "✓ SpiderFoot já está instalado"
else
    echo "   Instalando dependências de desenvolvimento para SpiderFoot..."
    sudo zypper install -y libxml2-devel libxslt-devel
    
    echo "   Clonando repositório do SpiderFoot..."
    git clone https://github.com/smicallef/spiderfoot.git "$HOME/osint-tools/spiderfoot"
    cd "$HOME/osint-tools/spiderfoot"
    
    # Criar ambiente virtual
    python3 -m venv venv
    # shellcheck source=/dev/null
    source venv/bin/activate
    pip install --upgrade pip setuptools wheel
    
    # Tentar instalar dependências
    if pip install -r requirements.txt; then
        deactivate
        
        # Criar script wrapper
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
        echo "   Tente executar o script novamente"
    fi
    cd - > /dev/null
fi

# GHunt (Google Account OSINT)
echo "Instalando GHunt..."
if command -v ghunt &> /dev/null; then
    echo "✓ GHunt já está instalado"
else
    echo "   Instalando GHunt via pipx..."
    if ! command -v pipx &> /dev/null; then
        sudo zypper install -y python3-pipx
    fi
    pipx install ghunt
    echo "✓ GHunt instalado com sucesso"
    echo "   Para usar: ghunt email <email>"
    check_success "GHunt"
fi

# PhoneInfoga (Phone Number OSINT)
echo "Instalando PhoneInfoga..."
if command -v phoneinfoga &> /dev/null; then
    echo "✓ PhoneInfoga já está instalado"
else
    echo "   Baixando PhoneInfoga..."
    mkdir -p "$HOME/osint-tools/phoneinfoga"
    cd "$HOME/osint-tools/phoneinfoga"
    
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
    cd - > /dev/null
    check_success "PhoneInfoga"
fi

# Maigret (Busca de Username Avançada)
echo "Instalando Maigret..."
if command -v maigret &> /dev/null; then
    echo "✓ Maigret já está instalado"
else
    echo "   Instalando Maigret via pipx..."
    if ! command -v pipx &> /dev/null; then
        sudo zypper install -y python3-pipx
    fi
    pipx install maigret
    echo "✓ Maigret instalado com sucesso"
    echo "   Para usar: maigret <username>"
    check_success "Maigret"
fi

echo ""
echo "✓ Ferramentas de OSINT instaladas com sucesso!"
echo ""
echo "📁 Ferramentas OSINT instaladas em: ~/osint-tools/"
echo ""

# Configurar Java
echo ""
echo "Configurando Java..."
sudo alternatives --install /usr/bin/java java /usr/lib64/jvm/java-11-openjdk-11/bin/java 1
sudo alternatives --set java /usr/lib64/jvm/java-11-openjdk-11/bin/java
echo "Java configurado como alternativa padrão"

# Configurar Git com autenticação
echo ""
echo "Configurando Git com autenticação..."
# Verificar se Git está instalado
if command -v git &> /dev/null; then
    # Verificar configuração do Git
    if ! git config --global user.name &> /dev/null || ! git config --global user.email &> /dev/null; then
        echo "⚠️  Configuração do Git não encontrada"
        echo "   Para configurar o Git, execute:"
        echo "   git config --global user.name 'Seu Nome'"
        echo "   git config --global user.email 'seu.email@exemplo.com'"
        echo ""
        echo "   Para configuração completa com GitHub, execute:"
        echo "   /home/juca/Documentos/Gerenciar Git/configurar-github.sh"
    else
        echo "✓ Git já está configurado"
        echo "   Nome: $(git config --global user.name)"
        echo "   Email: $(git config --global user.email)"
    fi
    
    # Verificar se chaves SSH existem
    if [ ! -f ~/.ssh/id_rsa ] || [ ! -f ~/.ssh/id_rsa.pub ]; then
        echo "⚠️  Chaves SSH não encontradas"
        echo "   Para gerar chaves SSH, execute:"
        echo "   ssh-keygen -t rsa -b 4096 -C 'seu.email@exemplo.com'"
        echo "   /home/juca/Documentos/Gerenciar Git/configurar-github.sh"
    else
        echo "✓ Chaves SSH já existem"
    fi
else
    echo "✗ Git não está instalado"
fi

# Verificar instalações
echo ""
echo "Verificando instalações..."

echo "Versão do Java:"
java -version

echo ""
echo "Versão do Node.js:"
node --version

echo ""
echo "Versão do npm:"
npm --version

echo ""
echo "Versão do Git:"
git --version

# Configurar Git (opcional)
echo ""
echo "Configuração do Git (opcional):"
echo "Para configurar o Git, execute:"
echo "git config --global user.name 'Seu Nome'"
echo "git config --global user.email 'seu.email@exemplo.com'"

# Instalar extensões úteis do VSCode (opcional)
echo ""
echo "Instalando extensões úteis do VSCode..."
# Verificar se o VSCode está disponível e não executar como root
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
    
    if timeout 30 code --install-extension bradlc.vscode-tailwindcss 2>/dev/null; then
        echo "   ✓ Tailwind CSS extension instalada"
    else
        echo "   ⚠️  Timeout ou erro ao instalar Tailwind CSS extension"
    fi
    
    if timeout 30 code --install-extension esbenp.prettier-vscode 2>/dev/null; then
        echo "   ✓ Prettier extension instalada"
    else
        echo "   ⚠️  Timeout ou erro ao instalar Prettier extension"
    fi
    
    echo "✓ Extensões do VSCode processadas"
else
    echo "⚠️  VSCode não disponível ou executando como root"
    echo "   Para instalar extensões, execute como usuário normal:"
    echo "   code --install-extension ms-python.python"
    echo "   code --install-extension ms-vscode.cpptools"
    echo "   code --install-extension redhat.vscode-yaml"
    echo "   code --install-extension bradlc.vscode-tailwindcss"
    echo "   code --install-extension esbenp.prettier-vscode"
fi

echo ""
echo "=========================================="
echo "Instalação concluída com sucesso!"
echo "=========================================="
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
echo "✓ Docker e Docker Compose"
echo ""
echo "🎮 Plataformas de Jogos:"
echo "✓ Osu! (Jogo de ritmo)"
echo "✓ Steam (Plataforma de jogos)"
echo "✓ Lutris (Gerenciador de jogos)"
echo "✓ Heroic Games Launcher (Epic Games & GOG)"
echo "✓ WinBoat (Executa aplicativos Windows no Linux)"
echo ""
echo "🔧 Ferramentas e Drivers:"
echo "✓ Driver Oficial da Huion (driver de tablet para tablets Huion)"
echo "✓ WireGuard (VPN moderna e segura)"
echo "✓ Compiladores e ferramentas de desenvolvimento"
echo "✓ Dependências do libfprint"
echo ""
echo "🔒 Ferramentas de Segurança (Kali Linux):"
echo "✓ Nmap (scanner de rede)"
echo "✓ Wireshark (análise de pacotes)"
echo "✓ John the Ripper (quebra de senhas)"
echo "✓ Hydra (brute force)"
echo "✓ Aircrack-ng (segurança WiFi)"
echo "✓ SQLMap (SQL injection)"
echo "✓ Nikto (scanner web)"
echo "✓ Hashcat (quebra de hash)"
echo "✓ Gobuster (directory/DNS bruteforce)"
echo "✓ ffuf (fuzzing web)"
echo ""
echo "🔍 Ferramentas de OSINT:"
echo "✓ Sherlock (busca de username em redes sociais)"
echo "✓ theHarvester (coleta de emails e informações)"
echo "✓ Recon-ng (framework de reconhecimento)"
echo "✓ SpiderFoot (automação OSINT)"
echo "✓ GHunt (OSINT de contas Google)"
echo "✓ PhoneInfoga (OSINT de números de telefone)"
echo "✓ Maigret (busca avançada de username)"
echo ""

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
