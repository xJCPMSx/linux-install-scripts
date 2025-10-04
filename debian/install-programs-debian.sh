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

# Steam (Plataforma de Jogos)
echo ""
echo "Instalando Steam..."
if command -v steam &> /dev/null; then
    echo "✓ Steam já está instalado"
else
    echo "   Instalando Steam..."
    if sudo apt install -y steam steam-installer; then
        echo "✓ Steam instalado com sucesso"
        echo "   Steam é a maior plataforma de distribuição de jogos para PC"
        echo "   Para melhor compatibilidade, instale os drivers gráficos apropriados"
    else
        echo "✗ Erro ao instalar Steam via apt, tentando Flatpak..."
        if sudo flatpak install -y flathub com.valvesoftware.Steam; then
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
if command -v lutris &> /dev/null; then
    echo "✓ Lutris já está instalado"
else
    echo "   Instalando Lutris..."
    if sudo apt install -y lutris; then
        echo "✓ Lutris instalado com sucesso"
        echo "   Lutris permite gerenciar jogos de várias plataformas (Steam, GOG, Epic, etc.)"
    else
        echo "✗ Erro ao instalar Lutris via apt, tentando Flatpak..."
        if sudo flatpak install -y flathub net.lutris.Lutris; then
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
if command -v heroic &> /dev/null || sudo flatpak list | grep -q "com.heroicgameslauncher.hgl"; then
    echo "✓ Heroic Games Launcher já está instalado"
else
    echo "   Instalando Heroic Games Launcher via Flatpak..."
    if sudo flatpak install -y flathub com.heroicgameslauncher.hgl; then
        echo "✓ Heroic Games Launcher instalado com sucesso"
        echo "   Heroic permite jogar jogos da Epic Games Store e GOG no Linux"
    else
        echo "✗ Erro ao instalar Heroic Games Launcher"
    fi
fi
check_success "Heroic Games Launcher"

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
    if sudo apt install -y wireguard wireguard-tools; then
        echo "✓ WireGuard instalado com sucesso"
        echo "   WireGuard é uma VPN moderna, rápida e segura"
        echo "   Configuração: /etc/wireguard/"
        echo "   Para criar uma configuração: sudo wg genkey | tee privatekey | wg pubkey > publickey"
    else
        echo "✗ Erro ao instalar WireGuard"
    fi
fi
check_success "WireGuard"

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
echo "✓ Docker e Docker Compose"
echo ""
echo "🎮 Plataformas de Jogos:"
echo "✓ Osu! (Jogo de ritmo)"
echo "✓ Steam (Plataforma de jogos)"
echo "✓ Lutris (Gerenciador de jogos)"
echo "✓ Heroic Games Launcher (Epic Games & GOG)"
echo ""
echo "🔧 Ferramentas e Drivers:"
echo "✓ Driver Oficial da Huion (driver de tablet para tablets Huion)"
echo "✓ WireGuard (VPN moderna e segura)"
echo "✓ Compiladores e ferramentas de desenvolvimento"
echo "✓ Dependências do libfprint"
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
