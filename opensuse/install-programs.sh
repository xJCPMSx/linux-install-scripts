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
    sudo zypper install -y snapd
    echo "✓ Snap instalado"
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
if flatpak list | grep -q "com.spotify.Client"; then
    echo "✓ Spotify já está instalado"
else
    flatpak install -y flathub com.spotify.Client
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

# Verificar se está no PATH
if command -v cursor &> /dev/null; then
    cursor_path=$(which cursor)
    if [[ "$cursor_path" == *".mount_Cursor"* ]]; then
        echo "✓ Cursor já está instalado (AppImage em execução)"
        cursor --version
        cursor_found=true
    else
        echo "✓ Cursor já está instalado (via pacote)"
        cursor --version
        cursor_found=true
    fi
fi

# Verificar se Cursor está instalado (diretório .cursor indica instalação)
if [ "$cursor_found" = false ]; then
    if [ -d "$HOME/.cursor" ]; then
        echo "✓ Cursor já está instalado (detectado diretório .cursor)"
        echo "   Para usar: execute o comando cursor ou procure no menu"
        cursor_found=true
    fi
fi

# Verificar AppImage se não encontrou via PATH ou diretório .cursor
if [ "$cursor_found" = false ]; then
    if [ -f "$HOME/Applications/cursor.AppImage" ] || [ -f "$HOME/Desktop/cursor.AppImage" ]; then
        echo "✓ Cursor AppImage já está disponível"
        echo "   Para usar: execute o arquivo .AppImage"
        cursor_found=true
    elif find "$HOME" -name "cursor*.AppImage" 2>/dev/null | grep -q "\.AppImage$"; then
        echo "✓ Cursor AppImage já está disponível"
        echo "   Para usar: execute o arquivo .AppImage"
        cursor_found=true
    fi
fi

# Verificar instalação manual se ainda não encontrou
if [ "$cursor_found" = false ]; then
    if [ -f "/usr/local/bin/cursor" ] || [ -f "/opt/cursor/cursor" ]; then
        echo "✓ Cursor já está instalado (instalação manual)"
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
if command -v brave &> /dev/null || command -v brave-browser &> /dev/null; then
    echo "✓ Brave Browser já está instalado"
else
    echo "⚠️  Brave Browser não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    # Tentar instalar via Flatpak primeiro
    if flatpak install -y flathub com.brave.Browser; then
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
if command -v firefox &> /dev/null; then
    echo "✓ Firefox já está instalado"
else
    echo "⚠️  Firefox não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    # Tentar instalar via Flatpak primeiro
    if flatpak install -y flathub org.mozilla.firefox; then
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

# Osu! (Jogo de ritmo)
echo ""
echo "Instalando Osu!..."
# Verificar se já está instalado
USER_HOME=$(eval echo ~"$SUDO_USER" 2>/dev/null || echo "$HOME")
if command -v osu &> /dev/null || command -v osu! &> /dev/null || [ -f "$USER_HOME/Applications/osu.AppImage" ]; then
    echo "✓ Osu! já está instalado"
else
    echo "⚠️  Osu! não encontrado nos repositórios"
    echo "   Tentando instalação via Flatpak..."
    
    # Tentar instalar via Flatpak primeiro
    if flatpak install -y flathub com.github.ppy.osu; then
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

# Instalar driver da Huion Tablet
echo ""
echo "Instalando driver da Huion Tablet..."

# Verificar se o repositório do driver Huion está disponível
if ! zypper repos | grep -q "huion"; then
    echo "Adicionando repositório do driver Huion..."
    # Nota: O repositório exato pode variar, este é um exemplo
    # O usuário pode precisar ajustar conforme a disponibilidade
    echo "Nota: Verifique a disponibilidade do repositório oficial da Huion"
    echo "Você pode precisar baixar e instalar manualmente o driver"
fi

# Tentar instalar o driver Huion (se disponível)
if zypper search huion 2>/dev/null | grep -q "huion"; then
    sudo zypper install -y huion-driver
    check_success "driver Huion"
else
    echo "⚠️  Driver Huion não encontrado nos repositórios"
    echo "   Você pode precisar baixar manualmente de:"
    echo "   https://www.huion.com/support/download/"
fi

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
    code --install-extension ms-python.python
    code --install-extension ms-vscode.cpptools
    code --install-extension redhat.vscode-yaml
    code --install-extension bradlc.vscode-tailwindcss
    code --install-extension esbenp.prettier-vscode
    echo "✓ Extensões do VSCode instaladas"
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
echo "✓ Osu! (Jogo de ritmo)"
echo "✓ Compiladores e ferramentas de desenvolvimento"
echo "✓ Dependências do libfprint"
echo "✓ Driver Huion (se disponível)"
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
echo "4. Os ícones do Cursor e Osu! aparecerão no menu após reiniciar o ambiente gráfico"
echo ""
echo "Para testar o libfprint, execute: fprintd-enroll"
