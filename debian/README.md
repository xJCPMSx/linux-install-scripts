# Script de Instalação Automática - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-11%2B-13%2B-A80030?style=flat&logo=debian)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-E95420?style=flat&logo=ubuntu)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição

Script automatizado para instalação de programas essenciais em sistemas baseados em Debian/Ubuntu, incluindo compiladores, ferramentas de desenvolvimento, ferramentas de IA, navegadores, editores de código e aplicativos.

## ✅ Distribuições Suportadas

- **Debian:** 11 (Bullseye), 12 (Bookworm), 13 (Trixie)
- **Ubuntu:** 20.04+, 22.04+, 24.04+
- **Linux Mint:** 20+
- **Pop!_OS:** 20.04+
- **Elementary OS:** 6+
- **Zorin OS:** 16+
- **Kali Linux:** Rolling

## 🎯 Programas Instalados

### 🤖 **Ferramentas de IA (Novas na v1.1-stable)**
- **Antigravity** - Ferramenta de IA via Python/PIP
- **Claude Code** - CLI oficial da Anthropic para engenharia de software assistida por IA
- **OpenCode** - Extensões para desenvolvimento (opcional)

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja, build-essential
- **Linguagens:** Java (OpenJDK com fallback automático), Node.js, npm, Python3, pip
- **Controle de Versão:** Git
- **Editores:** VSCode (via Flatpak), Cursor (AppImage - Editor com IA)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal (.deb oficial)
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎮 **Plataformas de Jogos & Otimização**
- **Steam** - Maior plataforma de distribuição de jogos para PC
- **Lutris** - Gerenciador de jogos (Steam, GOG, Epic, Emuladores, etc.)
- **Heroic Games Launcher** - Cliente para Epic Games Store e GOG
- **Osu!** - Jogo de ritmo (AppImage)
- **WinBoat** - Executa aplicativos Windows no Linux
- **GameMode** - Otimização de performance para jogos
- **DXVK** - Compatibilidade DirectX para Vulkan
- **Vulkan** - API gráfica moderna (retrocompatível com Debian 11/12)

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (Flatpak→Snap→Repositório com fallback)
- **yt-dlp** - Download de vídeos (sucessor do youtube-dl)

### 🛠️ **Ferramentas & Drivers**
- **AnyDesk** - Acesso remoto (.deb oficial)
- **Docker e Docker Compose** - Containerização
- **Driver Oficial da Huion** - Driver para tablets Huion (Kamvas, Inspiroy, etc.)
- **WireGuard** - VPN moderna e segura
- **FreeRDP 3** - Protocolo RDP moderno (essencial para WinBoat no Debian 13)
- **Fastfetch** - Ferramenta de informações do sistema (padrão no Debian 13, fallback para Neofetch em sistemas antigos)

### 🔒 **Segurança & OSINT (Kali Linux Tools)**
- **Nmap** - Scanner de rede
- **Wireshark** - Analisador de pacotes
- **John the Ripper** - Quebra de senhas
- **Hydra** - Brute force
- **Aircrack-ng** - Segurança WiFi
- **SQLMap** - SQL Injection
- **Nikto** - Scanner web
- **Hashcat** - Quebra de hash
- **Gobuster** - Directory/DNS bruteforce
- **ffuf** - Fuzzing web
- **SpiderFoot** - Automação OSINT
- **Sherlock** - Busca de username em redes sociais
- **theHarvester** - Coleta de emails e informações
- **GHunt** - OSINT de contas Google
- **PhoneInfoga** - OSINT de números de telefone
- **Maigret** - Busca avançada de username
- **Holehe** - Verificação de email em mais de 120 sites

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
- **Espaço:** ~3GB para instalação completa

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- ✅ **Detecção automática** da distribuição Debian/Ubuntu
- ✅ **Suporte completo ao Debian 13 (Trixie)** com correções de GPG e repositórios
- ✅ **Instalação seletiva** - apenas programas não instalados
- ✅ **Fallback robusto** - múltiplas fontes (repositórios, Flatpak, Snap, AppImage, .deb)
- ✅ **Retrocompatibilidade** - mantém suporte a Debian 11, Ubuntu 20.04+
- ✅ **Limpeza automática** de conflitos de repositórios
- ✅ **Mensagens informativas** durante todo o processo

### **🔧 Configuração Automática:**
- ✅ **Repositórios** oficiais adicionados (Chrome, Docker, etc.)
- ✅ **Chaves GPG** importadas automaticamente
- ✅ **Java** com fallback múltiplo automático
- ✅ **Git** preparado para uso com SSH
- ✅ **Docker** com usuário adicionado ao grupo
- ✅ **Extensões VSCode** instaladas automaticamente
- ✅ **Otimização automática** para jogos (GameMode, DXVK, Vulkan)
- ✅ **Habilitar TRIM** automaticamente para SSDs
- ✅ **Desabilitar serviços desnecessários** (bluetooth, cups, avahi-daemon)

## 🗂️ Estrutura do Projeto

```
.
├── auto-install.sh           # Detecção automática de distribuição
├── CHANGELOG.md              # Histórico de versões
├── config/
│   └── config.conf           # Configurações personalizáveis
├── debian/
│   ├── huion/                # Driver oficial da Huion
│   ├── install-programs-debian.sh
│   ├── README-EN.md
│   └── README.md
├── docker/
│   ├── docker-compose.yml
│   └── Dockerfile
├── gui-install.sh            # Interface gráfica
├── LICENSE
├── opensuse/
│   ├── huion/
│   ├── install-programs-opensuse.sh
│   ├── README-EN.md
│   └── README.md
├── README-EN.md
├── README.md
└── uninstall.sh              # Script de desinstalação
```

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
- KAMVAS GT-191, GT-221, Pro 16, Pro 22, Pro 24
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
INSTALL_CURSOR=true
INSTALL_CHROME=true
INSTALL_BRAVE=true
INSTALL_FIREFOX=true
INSTALL_JAVA=true
INSTALL_NODEJS=true
INSTALL_OSU=true
INSTALL_STEAM=true
INSTALL_DOCKER=true
INSTALL_HUION_DRIVER=true
INSTALL_YTDLP=true
INSTALL_ANTIGRAVITY=true
INSTALL_CLAUDE_CODE=true
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
- ✅ **Retrocompatibilidade** - Suporte a Debian 11, Ubuntu 20.04+
- ✅ **Suporte Debian 13 (Trixie)** - Correções completas de repositórios e GPG
- ✅ **Fastfetch** como padrão (Neofetch fallback em sistemas antigos)
- ✅ **FreeRDP 3** - Compatibilidade com Debian 13
- ⚠️ **Reboot recomendado** após instalação do Docker e Driver Huion
- ⚠️ **VSCode:** Instalado via Flatpak para evitar conflitos
- ⚠️ **Spotify:** Fallback triplo (Flatpak→Snap→Repositório)
- ⚠️ **Java:** Fallback múltiplo automático

## 🔗 Links Úteis

- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](../LICENSE) para mais detalhes.

---

**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em sistemas baseados em Debian/Ubuntu!**