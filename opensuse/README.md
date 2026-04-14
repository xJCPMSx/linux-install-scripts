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
- **Editores:** VSCode, Cursor (AI)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎮 **Plataformas de Jogos**
- **Steam** - Maior plataforma de jogos para PC
- **Lutris** - Gerenciador de jogos
- **Heroic Games Launcher** - Cliente Epic Games e GOG
- **Osu!** - Jogo de ritmo

### 🎵 **Multimídia**
- **Spotify** - Streaming de música
- **yt-dlp** - Download de vídeos

### 🛠️ **Ferramentas**
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
```

## 📝 Notas

- ✅ Suporte ao openSUSE Leap e Tumbleweed
- ✅ Otimização automática para jogos
- ✅ Retrocompatibilidade mantida
- ⚠️ Reboot recomendado após Docker

## 📄 Licença

MIT - See [LICENSE](../LICENSE)