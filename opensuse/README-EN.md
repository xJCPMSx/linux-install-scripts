# Automatic Installation Script - openSUSE

[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Leap](https://img.shields.io/badge/Leap-15.3+-green.svg)](https://www.opensuse.org/)
[![Tumbleweed](https://img.shields.io/badge/Tumbleweed-Supported-blue.svg)](https://www.opensuse.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md) *(Current)*
- [🇧🇷 Português](README.md)

## 📋 Description

Automated script for installing essential programs on openSUSE, including compilers, development tools, AI tools, browsers, code editors, and applications.

## ✅ Supported Distributions

- **openSUSE Leap 15.3+**
- **openSUSE Tumbleweed**
- **SUSE Linux Enterprise**

## 🎯 Installed Programs

### 🤖 **AI Tools (New in v1.1-stable)**
- **Antigravity** - AI tool via Python/PIP
- **Claude Code** - Official Anthropic CLI for AI-assisted software engineering

### 🔧 **Development Tools**
- **Compilers:** GCC, G++, Make, CMake, Ninja
- **Languages:** Java (OpenJDK), Node.js, npm, Python3
- **Version Control:** Git
- **Editors:** VSCode, Cursor (AI)

### 🌐 **Browsers**
- **Google Chrome** - Main browser
- **Brave Browser** - Privacy-focused browser (via Flatpak)
- **Firefox** - Alternative browser

### 🎮 **Gaming Platforms**
- **Steam** - Largest PC gaming platform
- **Lutris** - Game manager
- **Heroic Games Launcher** - Epic Games and GOG client
- **Osu!** - Rhythm game

### 🎵 **Multimedia**
- **Spotify** - Music streaming
- **yt-dlp** - Video download

### 🛠️ **Tools**
- **AnyDesk** - Remote access
- **Docker and Docker Compose** - Containerization
- **WireGuard** - Modern VPN
- **Fastfetch** - System information

### 🔒 **Security & OSINT**
- **Nmap, Wireshark, John the Ripper, Hydra**
- **SQLMap, Nikto, Hashcat, Gobuster**
- **SpiderFoot, Sherlock, theHarvester, GHunt**

## 🚀 How to Use

### **📋 Installation:**
```bash
cd opensuse
chmod +x install-programs-opensuse.sh
./install-programs-opensuse.sh
```

## ⚙️ Configuration

Edit `../config/config.conf` to customize:

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

## 📝 Notes

- ✅ Support for openSUSE Leap and Tumbleweed
- ✅ Automatic gaming optimization
- ✅ Backward compatibility maintained
- ⚠️ Reboot recommended after Docker

## 📄 License

MIT - See [LICENSE](../LICENSE)