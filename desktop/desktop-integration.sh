#!/bin/bash

# Integração com Desktops (KDE, GNOME, XFCE)
# Versão: 1.0-beta
# Data: 2025-09-28

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Função para detectar desktop
detect_desktop() {
    local desktop=""
    
    if [ -n "$XDG_CURRENT_DESKTOP" ]; then
        desktop="$XDG_CURRENT_DESKTOP"
    elif [ -n "$DESKTOP_SESSION" ]; then
        desktop="$DESKTOP_SESSION"
    elif [ -n "$GNOME_DESKTOP_SESSION_ID" ]; then
        desktop="GNOME"
    elif [ -n "$KDE_FULL_SESSION" ]; then
        desktop="KDE"
    elif [ -n "$XFCE_DESKTOP" ]; then
        desktop="XFCE"
    fi
    
    echo "$desktop"
}

# Função para integrar com KDE
integrate_kde() {
    echo -e "${BLUE}🖥️ Integrando com KDE...${NC}"
    
    # Criar entrada no menu do KDE
    local kde_menu_dir="$HOME/.local/share/applications"
    mkdir -p "$kde_menu_dir"
    
    # Linux Install Scripts
    cat > "$kde_menu_dir/linux-install-scripts.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts
Comment=Instalador automático de programas para Linux
Exec=$PWD/auto-install.sh
Icon=applications-system
Terminal=true
Categories=System;Settings;
StartupNotify=true
EOF
    
    # GUI Install Scripts
    cat > "$kde_menu_dir/linux-install-gui.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts (GUI)
Comment=Interface gráfica para instalação de programas
Exec=$PWD/gui/gui-install.sh
Icon=applications-system
Terminal=false
Categories=System;Settings;
StartupNotify=true
EOF
    
    # Backup Scripts
    cat > "$kde_menu_dir/linux-install-backup.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Backup
Comment=Gerenciador de backup do sistema
Exec=$PWD/backup/backup.sh
Icon=applications-system
Terminal=true
Categories=System;Settings;
StartupNotify=true
EOF
    
    chmod +x "$kde_menu_dir"/*.desktop
    
    # Atualizar banco de dados de aplicativos
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database "$kde_menu_dir"
    fi
    
    echo -e "${GREEN}✅ Integração com KDE concluída${NC}"
}

# Função para integrar com GNOME
integrate_gnome() {
    echo -e "${BLUE}🖥️ Integrando com GNOME...${NC}"
    
    # Criar entrada no menu do GNOME
    local gnome_menu_dir="$HOME/.local/share/applications"
    mkdir -p "$gnome_menu_dir"
    
    # Linux Install Scripts
    cat > "$gnome_menu_dir/linux-install-scripts.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts
Comment=Instalador automático de programas para Linux
Exec=$PWD/auto-install.sh
Icon=applications-system
Terminal=true
Categories=System;Settings;
StartupNotify=true
EOF
    
    # GUI Install Scripts
    cat > "$gnome_menu_dir/linux-install-gui.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts (GUI)
Comment=Interface gráfica para instalação de programas
Exec=$PWD/gui/gui-install.sh
Icon=applications-system
Terminal=false
Categories=System;Settings;
StartupNotify=true
EOF
    
    chmod +x "$gnome_menu_dir"/*.desktop
    
    # Atualizar banco de dados de aplicativos
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database "$gnome_menu_dir"
    fi
    
    # Integrar com GNOME Shell
    if command -v gsettings &> /dev/null; then
        echo "Configurando integração com GNOME Shell..."
        # Adicionar atalhos se necessário
    fi
    
    echo -e "${GREEN}✅ Integração com GNOME concluída${NC}"
}

# Função para integrar com XFCE
integrate_xfce() {
    echo -e "${BLUE}🖥️ Integrando com XFCE...${NC}"
    
    # Criar entrada no menu do XFCE
    local xfce_menu_dir="$HOME/.local/share/applications"
    mkdir -p "$xfce_menu_dir"
    
    # Linux Install Scripts
    cat > "$xfce_menu_dir/linux-install-scripts.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts
Comment=Instalador automático de programas para Linux
Exec=$PWD/auto-install.sh
Icon=applications-system
Terminal=true
Categories=System;Settings;
StartupNotify=true
EOF
    
    # GUI Install Scripts
    cat > "$xfce_menu_dir/linux-install-gui.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts (GUI)
Comment=Interface gráfica para instalação de programas
Exec=$PWD/gui/gui-install.sh
Icon=applications-system
Terminal=false
Categories=System;Settings;
StartupNotify=true
EOF
    
    chmod +x "$xfce_menu_dir"/*.desktop
    
    # Atualizar banco de dados de aplicativos
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database "$xfce_menu_dir"
    fi
    
    echo -e "${GREEN}✅ Integração com XFCE concluída${NC}"
}

# Função para criar atalhos na área de trabalho
create_desktop_shortcuts() {
    echo -e "${BLUE}🖥️ Criando atalhos na área de trabalho...${NC}"
    
    local desktop_dir="$HOME/Desktop"
    mkdir -p "$desktop_dir"
    
    # Atalho para auto-install
    cat > "$desktop_dir/Linux Install Scripts.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts
Comment=Instalador automático de programas para Linux
Exec=$PWD/auto-install.sh
Icon=applications-system
Terminal=true
Categories=System;Settings;
StartupNotify=true
EOF
    
    # Atalho para GUI
    cat > "$desktop_dir/Linux Install GUI.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Install Scripts (GUI)
Comment=Interface gráfica para instalação de programas
Exec=$PWD/gui/gui-install.sh
Icon=applications-system
Terminal=false
Categories=System;Settings;
StartupNotify=true
EOF
    
    chmod +x "$desktop_dir"/*.desktop
    
    echo -e "${GREEN}✅ Atalhos criados na área de trabalho${NC}"
}

# Função para configurar autostart
setup_autostart() {
    echo -e "${BLUE}🖥️ Configurando autostart...${NC}"
    
    local autostart_dir="$HOME/.config/autostart"
    mkdir -p "$autostart_dir"
    
    # Não configurar autostart por padrão
    # Esta função está aqui para futuras implementações
    echo -e "${YELLOW}⚠️ Autostart não configurado por padrão${NC}"
}

# Função para configurar painel
setup_panel() {
    local desktop=$(detect_desktop)
    
    case "$desktop" in
        "KDE"|"KDE4"|"KDE5")
            echo -e "${BLUE}🖥️ Configurando painel do KDE...${NC}"
            # Configurações específicas do KDE
            ;;
        "GNOME")
            echo -e "${BLUE}🖥️ Configurando painel do GNOME...${NC}"
            # Configurações específicas do GNOME
            ;;
        "XFCE")
            echo -e "${BLUE}🖥️ Configurando painel do XFCE...${NC}"
            # Configurações específicas do XFCE
            ;;
        *)
            echo -e "${YELLOW}⚠️ Desktop não reconhecido: $desktop${NC}"
            ;;
    esac
}

# Função para mostrar status da integração
show_integration_status() {
    echo -e "${BLUE}📊 Status da Integração:${NC}"
    echo "=========================="
    
    local desktop=$(detect_desktop)
    echo "Desktop detectado: $desktop"
    
    # Verificar se os arquivos .desktop existem
    local menu_dir="$HOME/.local/share/applications"
    if [ -d "$menu_dir" ]; then
        echo "Menu entries:"
        ls -la "$menu_dir"/linux-install-*.desktop 2>/dev/null || echo "Nenhum encontrado"
    fi
    
    # Verificar atalhos na área de trabalho
    local desktop_dir="$HOME/Desktop"
    if [ -d "$desktop_dir" ]; then
        echo "Desktop shortcuts:"
        ls -la "$desktop_dir"/Linux\ Install*.desktop 2>/dev/null || echo "Nenhum encontrado"
    fi
    
    echo ""
    echo -e "${CYAN}📋 Comandos disponíveis:${NC}"
    echo "• Menu: Procure por 'Linux Install' no menu de aplicações"
    echo "• Desktop: Clique nos atalhos na área de trabalho"
    echo "• Terminal: Execute ./auto-install.sh"
    echo "• GUI: Execute ./gui/gui-install.sh"
}

# Função principal
main() {
    echo -e "${BLUE}🖥️ Integração com Desktops${NC}"
    echo "============================="
    
    local desktop=$(detect_desktop)
    echo -e "${CYAN}Desktop detectado: $desktop${NC}"
    
    case "$desktop" in
        "KDE"|"KDE4"|"KDE5")
            integrate_kde
            ;;
        "GNOME")
            integrate_gnome
            ;;
        "XFCE")
            integrate_xfce
            ;;
        *)
            echo -e "${YELLOW}⚠️ Desktop não suportado: $desktop${NC}"
            echo "Tentando integração genérica..."
            integrate_kde  # Usar KDE como padrão
            ;;
    esac
    
    # Criar atalhos na área de trabalho
    create_desktop_shortcuts
    
    # Configurar painel
    setup_panel
    
    # Mostrar status
    show_integration_status
}

# Executar função principal
main "$@"
