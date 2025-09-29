#!/bin/bash

# Script para instalar OpenTabletDriver
echo "🎮 Instalando OpenTabletDriver..."

# Verificar se já está instalado
if flatpak list | grep -q "net.opentabletdriver.OpenTabletDriver"; then
    echo "✓ OpenTabletDriver já está instalado via Flatpak"
    echo "Para executar: flatpak run net.opentabletdriver.OpenTabletDriver"
    exit 0
fi

# Tentar instalar via Flatpak
echo "📦 Tentando instalar via Flatpak..."
if sudo flatpak install -y flathub net.opentabletdriver.OpenTabletDriver; then
    echo "✅ OpenTabletDriver instalado com sucesso via Flatpak!"
    echo ""
    echo "Para executar:"
    echo "  flatpak run net.opentabletdriver.OpenTabletDriver"
    echo ""
    echo "Ou procure 'OpenTabletDriver' no menu de aplicações"
    exit 0
fi

# Se Flatpak falhar, tentar download direto
echo "⚠️  Flatpak falhou, tentando download direto..."

# Criar diretório
mkdir -p "$HOME/Applications/OpenTabletDriver"

# Tentar baixar AppImage
echo "📥 Baixando OpenTabletDriver..."
if wget -O "$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage" https://github.com/OpenTablet/OpenTabletDriver/releases/latest/download/OpenTabletDriver.AppImage; then
    # Verificar se o arquivo não está vazio
    if [ -s "$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage" ]; then
        chmod +x "$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage"
        echo "✅ OpenTabletDriver baixado com sucesso!"
        echo ""
        echo "Para executar:"
        echo "  $HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage"
        echo ""
        echo "Ou procure 'OpenTabletDriver' no menu de aplicações"
        
        # Criar arquivo desktop
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
        echo "✅ Ícone criado no menu de aplicações"
    else
        echo "❌ Arquivo baixado está vazio"
        echo "💡 Tente instalar manualmente via Flatpak:"
        echo "   sudo flatpak install flathub net.opentabletdriver.OpenTabletDriver"
    fi
else
    echo "❌ Erro ao baixar OpenTabletDriver"
    echo "💡 Tente instalar manualmente via Flatpak:"
    echo "   sudo flatpak install flathub net.opentabletdriver.OpenTabletDriver"
fi
