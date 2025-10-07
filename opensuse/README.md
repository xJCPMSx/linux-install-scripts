# Script de Instalação Automática - openSUSE

[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Leap](https://img.shields.io/badge/Leap-15.3+-green.svg)](https://www.opensuse.org/)
[![Tumbleweed](https://img.shields.io/badge/Tumbleweed-Supported-blue.svg)](https://www.opensuse.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição

Script automatizado para instalação de programas essenciais no openSUSE, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e aplicativos.

## 🎯 Programas Instalados

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja
- **Linguagens:** Java (OpenJDK), Node.js, npm
- **Controle de Versão:** Git
- **Editores:** VSCode, Cursor (AI)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎮 **Plataformas de Jogos**
- **Steam** - Maior plataforma de distribuição de jogos para PC
- **Lutris** - Gerenciador de jogos (Steam, GOG, Epic, Emuladores, etc.)
- **Heroic Games Launcher** - Cliente para Epic Games Store e GOG
- **Osu!** - Jogo de ritmo (AppImage)

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (via Flatpak)
- **yt-dlp** - Download de vídeos

### 🛠️ **Ferramentas**
- **AnyDesk** - Acesso remoto
- **Docker e Docker Compose** - Containerização
- **Driver Oficial da Huion** - Driver para tablets Huion
- **WireGuard** - VPN moderna e segura

## 🚀 Como Usar

### **🎯 Instalação Automática (Recomendado):**
```bash
# Clone o repositório
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts

# Detecção automática (executa script do openSUSE)
./auto-install.sh
```

### **🖥️ Interface Gráfica:**
```bash
# Interface gráfica interativa
./gui-install.sh
```

### **📋 Instalação Manual:**
```bash
# Executar script específico do openSUSE
cd opensuse
chmod +x install-programs-opensuse.sh
./install-programs-opensuse.sh
```

## 📋 Pré-requisitos

- **Sistema:** openSUSE Leap 15.3+ ou Tumbleweed
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável
- **Espaço:** ~2GB para instalação completa

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- ✅ **Detecção automática** da versão do openSUSE
- ✅ **Instalação seletiva** - apenas programas não instalados
- ✅ **Fallback robusto** - múltiplas fontes (repositórios, Flatpak, Snap, AppImage)
- ✅ **Limpeza automática** de conflitos de repositórios
- ✅ **Mensagens informativas** durante todo o processo
- ✅ **Verificações aprimoradas** - detecta apps via comando, zypper, flatpak, snap
- ✅ **Nova ferramenta OSINT** - Holehe para verificação de emails

### **🔧 Configuração Automática:**
- ✅ **Repositórios** necessários adicionados automaticamente (VSCode, Chrome, Snappy)
- ✅ **Chaves GPG** importadas automaticamente
- ✅ **Java** configurado como alternativa padrão
- ✅ **Git** preparado para uso com SSH
- ✅ **Docker** com usuário adicionado ao grupo
- ✅ **Extensões VSCode** instaladas automaticamente
- ✅ **Ícones** criados para Cursor e Osu!

### **📦 Gerenciadores de Pacotes:**
- ✅ **Zypper** - Gerenciador nativo do openSUSE
- ✅ **Flatpak** - Aplicações universais via Flathub
- ✅ **Snap** - Aplicações containerizadas

## 🐳 Docker e Docker Compose

### **🔧 Instalação Automática:**
- **Docker CE** instalado via pacotes do sistema
- **Docker Compose** disponível como plugin (`docker compose`)
- **Usuário adicionado ao grupo docker** (uso sem sudo após reboot)
- **Serviço habilitado e iniciado** automaticamente

### **💡 Como usar:**
```bash
# Verificar instalação
docker --version
docker compose version

# Executar container de teste
docker run hello-world

# Usar Docker Compose
docker compose up -d
```

**⚠️ Importante:** Faça logout/login (ou reboot) após a instalação para usar Docker sem sudo.

## 🎮 Driver Oficial da Huion

### **🔧 Instalação Automática:**
- **Driver oficial** incluído no repositório (`opensuse/huion/`)
- **Instalação integrada** no script
- **Ícone criado** no menu de aplicações
- **Regras udev** configuradas automaticamente
- **Melhor compatibilidade** com tablets Huion

### **💡 Modelos Suportados:**
- INSPIROY H430P, H640P, H950P, H1060P
- KAMVAS GT-191, GT-221, Pro 16, Pro 22
- E muitos outros modelos Huion

### **📝 Como usar:**
```bash
# Após instalação, procure "Huion Tablet" no menu de aplicações
# Configure área de trabalho, botões e sensibilidade
# Para osu!: configure Raw Input: OFF nas configurações do jogo
```

**⚠️ Importante:** Reinicie o sistema após a instalação do driver para funcionamento correto.

## 📺 yt-dlp - Download de Vídeos

### **🔧 Instalação:**
- **Sucessor do youtube-dl** mais atualizado e mantido
- **Suporte a múltiplas plataformas** (YouTube, Vimeo, Twitch, SoundCloud, etc.)
- **Instalação via pip** (sempre a versão mais recente)

### **💡 Uso Básico:**
```bash
# Download de vídeo
yt-dlp "https://www.youtube.com/watch?v=VIDEO_ID"

# Download apenas do áudio (MP3)
yt-dlp -x --audio-format mp3 "URL_DO_VIDEO"

# Download em qualidade específica
yt-dlp -f "best[height<=720]" "URL_DO_VIDEO"

# Download de playlist completa
yt-dlp "URL_DA_PLAYLIST"
```

## 🔒 WireGuard - VPN Moderna

### **🔧 Instalação Automática:**
- **VPN moderna, rápida e segura**
- **Configuração simplificada** comparado a OpenVPN
- **Instalado automaticamente** via zypper (wireguard-tools)
- **Arquivos de configuração** em `/etc/wireguard/`

### **💡 Uso Básico:**
```bash
# Gerar chaves
sudo wg genkey | tee privatekey | wg pubkey > publickey

# Criar configuração
sudo nano /etc/wireguard/wg0.conf

# Iniciar/Parar VPN
sudo wg-quick up wg0
sudo wg-quick down wg0

# Habilitar no boot
sudo systemctl enable wg-quick@wg0

# Ver status
sudo wg show
```

## ⚙️ Configuração Personalizada

Edite o arquivo `../config/config.conf` para personalizar a instalação:

```ini
[INSTALLATION]
INSTALL_ANYDESK=true
INSTALL_SPOTIFY=true
INSTALL_VSCODE=true
INSTALL_CURSOR=false
INSTALL_CHROME=true
INSTALL_BRAVE=false
INSTALL_FIREFOX=false
INSTALL_JAVA=true
INSTALL_NODEJS=true
INSTALL_OSU=true
INSTALL_DOCKER=true
INSTALL_HUION_DRIVER=true
INSTALL_YTDLP=true
```

Depois execute:
```bash
./install-programs.sh
```

## 🗑️ Desinstalação

Para remover todos os programas instalados:

```bash
# Na raiz do projeto
cd ..
./uninstall.sh
```

## 📝 Notas Importantes

- ✅ **Instalação inteligente** - Detecta programas já instalados
- ✅ **Múltiplas tentativas** - Tenta diferentes métodos de instalação
- ⚠️ **Reboot recomendado** após instalação do Docker e Driver Huion
- ✅ **Logs detalhados** para troubleshooting
- ⚠️ **VSCode:** Extensões instaladas apenas quando executado sem sudo

## 🔗 Links Úteis

- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação Principal:** [README.md](../README.md)

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](../LICENSE) para mais detalhes.

---

**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento no openSUSE!**
