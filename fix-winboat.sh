#!/bin/bash

echo "🔧 Corrigindo WinBoat com URL atualizada..."

# 1. Remover instalação anterior
echo "🗑️  Removendo instalação anterior..."
rm -f ~/Applications/WinBoat.AppImage
rm -f ~/.local/share/applications/winboat.desktop
rm -f ~/.local/share/icons/winboat.svg

# 2. Baixar WinBoat com URL corrigida
echo "📥 Baixando WinBoat com URL corrigida..."
mkdir -p ~/Applications

# Tentar diferentes URLs possíveis
WINBOAT_URLS=(
    "https://github.com/TibixDev/winboat/releases/download/v0.8.5/winboat-0.8.5-x86_64.AppImage"
    "https://github.com/WinBoat-App/WinBoat/releases/latest/download/winboat-x86_64.AppImage"
    "https://github.com/WinBoat-App/WinBoat/releases/latest/download/WinBoat-x86_64.AppImage"
    "https://github.com/WinBoat-App/WinBoat/releases/latest/download/winboat.AppImage"
    "https://github.com/WinBoat-App/WinBoat/releases/latest/download/WinBoat.AppImage"
)

SUCCESS=false
for URL in "${WINBOAT_URLS[@]}"; do
    echo "   Tentando: $URL"
    if wget --timeout=30 -O ~/Applications/WinBoat.AppImage "$URL" 2>/dev/null && [ -s ~/Applications/WinBoat.AppImage ]; then
        echo "   ✅ Sucesso com: $URL"
        SUCCESS=true
        break
    else
        echo "   ❌ Falhou: $URL"
        rm -f ~/Applications/WinBoat.AppImage
    fi
done

if [ "$SUCCESS" = true ]; then
    echo "✅ WinBoat baixado com sucesso"
    chmod +x ~/Applications/WinBoat.AppImage
    
    # 3. Criar desktop file
    echo "📱 Criando desktop file..."
    cat > ~/.local/share/applications/winboat.desktop << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=WinBoat
Comment=Run Windows applications on Linux
Exec=/home/juca/Applications/WinBoat.AppImage
Icon=winboat
Terminal=false
Categories=Utility;Emulator;
StartupNotify=true
EOF
    chmod +x ~/.local/share/applications/winboat.desktop
    
    # 4. Criar ícone
    echo "🎨 Criando ícone..."
    cat > ~/.local/share/icons/winboat.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
  <polyline points="9,22 9,12 15,12 15,22"/>
</svg>
EOF
    
    # 5. Atualizar base de dados
    update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
    gtk-update-icon-cache -f -t ~/.local/share/icons/ 2>/dev/null || true
    
    echo "✅ WinBoat corrigido com sucesso!"
    echo "🔍 Testando execução..."
    if ~/Applications/WinBoat.AppImage --version 2>/dev/null; then
        echo "✅ WinBoat está funcionando!"
    else
        echo "⚠️  WinBoat baixado mas pode ter problemas de execução"
        echo "   Tente executar: ~/Applications/WinBoat.AppImage"
    fi
else
    echo "❌ Falha ao baixar WinBoat de todas as URLs testadas"
    echo "🔍 Verificando repositório GitHub..."
    echo "   Visite: https://github.com/WinBoat-App/WinBoat/releases"
    echo "   Ou: https://www.winboat.app/"
    echo ""
    echo "💡 Alternativas para executar apps Windows no Linux:"
    echo "   - Wine: sudo zypper install wine"
    echo "   - PlayOnLinux: sudo zypper install playonlinux"
    echo "   - VirtualBox: sudo zypper install virtualbox"
fi
