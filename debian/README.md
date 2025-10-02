# Script de Instalação Automática - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![Linux Mint](https://img.shields.io/badge/Linux%20Mint-Supported-green.svg)](https://linuxmint.com/)
[![Kali](https://img.shields.io/badge/Kali-Supported-purple.svg)](https://www.kali.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição

Script automatizado para instalação de programas essenciais em sistemas baseados em Debian/Ubuntu, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e aplicativos.

## 🎯 Programas Instalados

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja, build-essential
- **Linguagens:** Java (OpenJDK com fallback 11→17→21), Node.js, npm
- **Controle de Versão:** Git
- **Editores:** VSCode (via Flatpak), Cursor (AI)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal (.deb oficial)
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (Flatpak→Snap→Repositório com fallback)
- **Osu!** - Jogo de ritmo (AppImage)

### 🛠️ **Ferramentas**
- **AnyDesk** - Acesso remoto (.deb oficial)
- **Docker e Docker Compose** - Containerização
- **Driver Oficial da Huion** - Driver para tablets Huion
- **WireGuard** - VPN moderna e segura
- **yt-dlp** - Download de vídeos

## 🚀 Como Usar

### **🎯 Instalação Automática (Recomendado):**
```bash
# Clone o repositório
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts

# Detecção automática (executa script do Debian/Ubuntu)
./auto-install.sh
```

### **🖥️ Interface Gráfica:**
```bash
# Interface gráfica interativa
./gui-install.sh
```

### **📋 Instalação Manual:**
```bash
# Executar script específico do Debian/Ubuntu
cd debian
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📋 Pré-requisitos

- **Sistema:** Debian 11+, Ubuntu 20.04+, Linux Mint 20+, Pop!_OS 20.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável
- **Espaço:** ~2GB para instalação completa

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- ✅ **Detecção automática** da distribuição Debian/Ubuntu
- ✅ **Instalação seletiva** - apenas programas não instalados
- ✅ **Fallback robusto** - múltiplas fontes (repositórios, Flatpak, Snap, AppImage, .deb)
- ✅ **Limpeza automática** de conflitos de repositórios (remove repos problemáticos)
- ✅ **Mensagens informativas** durante todo o processo

### **🔧 Configuração Automática:**
- ✅ **Repositórios** oficiais adicionados (Chrome via .deb)
- ✅ **Chaves GPG** importadas automaticamente
- ✅ **Java** com fallback múltiplo (11→17→21→default)
- ✅ **Git** preparado para uso com SSH
- ✅ **Docker** com usuário adicionado ao grupo
- ✅ **Extensões VSCode** instaladas automaticamente
- ✅ **Ícones** criados para Cursor e Osu!

### **📦 Gerenciadores de Pacotes:**
- ✅ **APT** - Gerenciador nativo do Debian/Ubuntu
- ✅ **Flatpak** - Aplicações universais via Flathub
- ✅ **Snap** - Aplicações containerizadas (quando necessário)

### **🛠️ Resolução de Problemas:**
- ✅ **VSCode via Flatpak** - Evita conflitos de repositórios
- ✅ **Spotify com fallback triplo** - Flatpak→Snap→Repositório
- ✅ **Java não encontrado** - Fallback automático para múltiplas versões
- ✅ **Conflitos de repositórios** - Limpeza automática integrada

## 🐳 Docker e Docker Compose

### **🔧 Instalação Automática:**
- **Docker CE** instalado via repositório oficial
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
- **Driver oficial** incluído no repositório (`debian/huion/`)
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
- **Instalado automaticamente** via apt (wireguard wireguard-tools)
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
./install-programs-debian.sh
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
- ⚠️ **VSCode:** Instalado via Flatpak para evitar conflitos
- ⚠️ **Spotify:** Fallback triplo (Flatpak→Snap→Repositório)
- ⚠️ **Java:** Fallback múltiplo (11→17→21→default)

## 🔗 Links Úteis

- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação Principal:** [README.md](../README.md)

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](../LICENSE) para mais detalhes.

---

**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em sistemas baseados em Debian/Ubuntu!**
