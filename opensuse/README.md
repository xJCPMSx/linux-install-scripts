# Script de Instalação Automática - openSUSE

[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Leap](https://img.shields.io/badge/Leap-15.3+-green.svg)](https://www.opensuse.org/)
[![Tumbleweed](https://img.shields.io/badge/Tumbleweed-Supported-blue.svg)](https://www.opensuse.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição

Script automatizado para instalação de programas essenciais no openSUSE, incluindo compiladores, ferramentas de desenvolvimento, ferramentas de IA, navegadores, editores de código e aplicativos.

## ✅ Distribuições Suportadas

- **openSUSE Leap 15.3+**
- **openSUSE Tumbleweed**
- **SUSE Linux Enterprise**

## 🎯 Programas Instalados

### 🤖 **Ferramentas de IA (Novas na v1.1-stable)**
- **Antigravity** - Ferramenta de IA via Python/PIP
- **Claude Code** - CLI oficial da Anthropic para engenharia de software assistida por IA

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja
- **Linguagens:** Java (OpenJDK), Node.js, npm, Python3
- **Controle de Versão:** Git
- **Editores:** VSCode (Flatpak), Cursor (AppImage)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎮 **Plataformas de Jogos & Otimização**
- **Steam** - Maior plataforma de jogos para PC
- **Lutris** - Gerenciador de jogos
- **Heroic Games Launcher** - Cliente Epic Games e GOG
- **Osu!** - Jogo de ritmo
- **GameMode** - Otimização de performance
- **DXVK** - Compatibilidade DirectX para Vulkan

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (Flatpak)
- **yt-dlp** - Download de vídeos

### 🛠️ **Ferramentas & Drivers**
- **AnyDesk** - Acesso remoto
- **Docker e Docker Compose** - Containerização
- **WireGuard** - VPN moderna
- **Fastfetch** - Informações do sistema

### 🔒 **Segurança & OSINT**
- **Nmap, Wireshark, John the Ripper, Hydra**
- **SQLMap, Nikto, Hashcat, Gobuster**
- **SpiderFoot, Sherlock, theHarvester, GHunt**

## 🚀 Como Usar

### **📋 Instalação:**
```bash
cd opensuse
chmod +x install-programs-opensuse.sh
./install-programs-opensuse.sh
```

## 🐳 Docker e Docker Compose

### **🔧 Instalação Automática:**
- **Docker CE** instalado via repositório oficial
- **Docker Compose** disponível como plugin
- **Usuário adicionado ao grupo docker** (uso sem sudo após reboot)
- **Serviço habilitado e iniciado** automaticamente

### **💡 Como usar:**
```bash
docker --version
docker compose version
docker run hello-world
```

**⚠️ Importante:** Faça logout/login (ou reboot) após a instalação para usar Docker sem sudo.

## 🎮 Otimização para Jogos

### **🔧 Configurações Automáticas:**
- **GameMode** - Otimização de CPU/GPU para jogos
- **DXVK** - Tradução DirectX para Vulkan
- **Mesa Drivers** - Drivers otimizados
- **Vulkan** - API gráfica moderna
- **VAR_HANDLE** - Correções para jogos Windows

### **💡 Configurações Adicionais:**
```bash
# Habilitar GameMode para um jogo
gamemoderun steam

# Verificar Vulkan
vulkaninfo
```

## 🔒 WireGuard - VPN Moderna

### **🔧 Instalação Automática:**
- **VPN moderna, rápida e segura**
- **Instalado automaticamente** via zypper
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
```

## 📺 yt-dlp - Download de Vídeos

### **🔧 Instalação:**
- **Sucessor do youtube-dl** mais atualizado
- **Suporte a múltiplas plataformas**

### **💡 Uso Básico:**
```bash
# Download de vídeo
yt-dlp "URL_DO_VIDEO"

# Download áudio (MP3)
yt-dlp -x --audio-format mp3 "URL"

# Download qualidade específica
yt-dlp -f "best[height<=720]" "URL"
```

## 🔐 Ferramentas de Segurança - Guia Completo

### **🛡️ Nmap - Scanner de Rede**

```bash
# Scan básico
nmap 192.168.1.1

# Scan completo
nmap -sV -sC -p- 192.168.1.1

# Scan de rede
nmap -sP 192.168.1.0/24
```

### **📡 Wireshark - Analisador de Pacotes**

```bash
# Iniciar Wireshark
sudo wireshark

# Captura via CLI
sudo tshark -i eth0 -c 100
```

### **🔓 Hydra - Brute Force**

```bash
# SSH brute force
hydra -l usuario -P wordlist.txt ssh://192.168.1.1

# HTTP POST
hydra -l admin -P wordlist.txt 192.168.1.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=incorrect"
```

### **💉 SQLMap - SQL Injection**

```bash
# Testar URL
sqlmap -u "http://alvo.com/pagina.php?id=1"

# Enumeração de databases
sqlmap -u "http://alvo.com/pagina.php?id=1" --dbs

# Extrair dados
sqlmap -u "http://alvo.com/pagina.php?id=1" -D db -T usuarios --dump
```

## 🔍 Ferramentas de OSINT - Guia Completo

### **📂 Localização das Ferramentas**

As ferramentas OSINT são instaladas em `~/osint-tools/`:

```
~/osint-tools/
├── sherlock/
├── theHarvester/
├── maigret/
├── holehe/
├── GHunt/
├── phoneinfoga/
└── spiderfoot/
```

### **🔎 Sherlock**

```bash
python3 ~/osint-tools/sherlock/sherlock.py usuario
python3 ~/osint-tools/sherlock/sherlock.py usuario --json --output resultados.txt
```

### **🌐 theHarvester**

```bash
theHarvester -d exemplo.com -b google
theHarvester -d exemplo.com -b all -f resultados.html
```

### **🎯 Maigret**

```bash
python3 ~/osint-tools/maigret/maigret.py usuario
python3 ~/osint-tools/maigret/maigret.py usuario -v
```

### **📧 Holehe**

```bash
python3 ~/osint-tools/holehe/holehe.py email@exemplo.com
python3 ~/osint-tools/holehe/holehe.py email@exemplo.com --json
```

### **📱 GHunt**

```bash
python3 ~/osint-tools/GHunt/ghunt.py email@exemplo.com
python3 ~/osint-tools/GHunt/ghunt.py --check
```

### **📞 PhoneInfoga**

```bash
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 -i
```

### **🕷️ SpiderFoot**

```bash
sf -s 192.168.1.1
sfcli -s example.com -M sfp_arin -M sfp_dnsresolv
```

**Acesse:** http://localhost:5001 para interface web

---

## ⚙️ Configuração

Edite `../config/config.conf` para personalizar:

```ini
[INSTALLATION]
INSTALL_ANYDESK=true
INSTALL_SPOTIFY=true
INSTALL_VSCODE=true
INSTALL_CHROME=true
INSTALL_BRAVE=true
INSTALL_FIREFOX=true
INSTALL_JAVA=true
INSTALL_NODEJS=true
INSTALL_STEAM=true
INSTALL_DOCKER=true
INSTALL_ANTIGRAVITY=true
INSTALL_CLAUDE_CODE=true

[GAMING]
INSTALL_STEAM=true
INSTALL_LUTRIS=true
INSTALL_HEROIC=true
ENABLE_GAMEMODE=true
ENABLE_VULKAN=true
```

## 📝 Notas

- ✅ Suporte ao openSUSE Leap e Tumbleweed
- ✅ Otimização automática para jogos
- ✅ Retrocompatibilidade mantida
- ✅ Ferramentas de Segurança e OSINT inclusas
- ⚠️ Reboot recomendado após Docker

## 📄 Licença

MIT - See [LICENSE](../LICENSE)