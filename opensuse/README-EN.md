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
- **Editors:** VSCode (Flatpak), Cursor (AppImage)

### 🌐 **Browsers**
- **Google Chrome** - Main browser
- **Brave Browser** - Privacy-focused browser (via Flatpak)
- **Firefox** - Alternative browser

### 🎮 **Gaming Platforms & Optimization**
- **Steam** - Largest PC gaming platform
- **Lutris** - Game manager
- **Heroic Games Launcher** - Epic Games and GOG client
- **Osu!** - Rhythm game
- **GameMode** - Performance optimization
- **DXVK** - DirectX to Vulkan compatibility

### 🎵 **Multimedia**
- **Spotify** - Music streaming (Flatpak)
- **yt-dlp** - Video download

### 🛠️ **Tools & Drivers**
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

## 🐳 Docker and Docker Compose

### **🔧 Automatic Installation:**
- **Docker CE** installed via official repository
- **Docker Compose** available as plugin
- **User added to docker group** (use without sudo after reboot)
- **Service enabled and started** automatically

### **💡 How to Use:**
```bash
docker --version
docker compose version
docker run hello-world
```

**⚠️ Important:** Log out/login (or reboot) after installation to use Docker without sudo.

## 🎮 Gaming Optimization

### **🔧 Automatic Settings:**
- **GameMode** - CPU/GPU optimization for games
- **DXVK** - DirectX to Vulkan translation
- **Mesa Drivers** - Optimized drivers
- **Vulkan** - Modern graphics API
- **VAR_HANDLE** - Fixes for Windows games

### **💡 Additional Settings:**
```bash
# Enable GameMode for a game
gamemoderun steam

# Check Vulkan
vulkaninfo
```

## 🔒 WireGuard - Modern VPN

### **🔧 Automatic Installation:**
- **Modern, fast and secure VPN**
- **Automatically installed** via zypper
- **Configuration files** in `/etc/wireguard/`

### **💡 Basic Usage:**
```bash
# Generate keys
sudo wg genkey | tee privatekey | wg pubkey > publickey

# Create configuration
sudo nano /etc/wireguard/wg0.conf

# Start/Stop VPN
sudo wg-quick up wg0
sudo wg-quick down wg0
```

## 📺 yt-dlp - Video Download

### **🔧 Installation:**
- **youtube-dl successor** more updated
- **Multi-platform support**

### **💡 Basic Usage:**
```bash
# Video download
yt-dlp "VIDEO_URL"

# Audio only (MP3)
yt-dlp -x --audio-format mp3 "URL"

# Specific quality
yt-dlp -f "best[height<=720]" "URL"
```

## 🔐 Security Tools - Complete Guide

### **🛡️ Nmap - Network Scanner**

```bash
# Basic scan
nmap 192.168.1.1

# Full scan
nmap -sV -sC -p- 192.168.1.1

# Network scan
nmap -sP 192.168.1.0/24
```

### **📡 Wireshark - Packet Analyzer**

```bash
# Start Wireshark
sudo wireshark

# CLI capture
sudo tshark -i eth0 -c 100
```

### **🔓 Hydra - Brute Force**

```bash
# SSH brute force
hydra -l user -P wordlist.txt ssh://192.168.1.1

# HTTP POST
hydra -l admin -P wordlist.txt 192.168.1.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=incorrect"
```

### **💉 SQLMap - SQL Injection**

```bash
# Test URL
sqlmap -u "http://target.com/page.php?id=1"

# Database enumeration
sqlmap -u "http://target.com/page.php?id=1" --dbs

# Dump data
sqlmap -u "http://target.com/page.php?id=1" -D db -T users --dump
```

## 🔍 OSINT Tools - Complete Guide

### **📂 Tool Locations**

OSINT tools are installed in `~/osint-tools/`:

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
python3 ~/osint-tools/sherlock/sherlock.py username
python3 ~/osint-tools/sherlock/sherlock.py username --json --output results.txt
```

### **🌐 theHarvester**

```bash
theHarvester -d example.com -b google
theHarvester -d example.com -b all -f results.html
```

### **🎯 Maigret**

```bash
python3 ~/osint-tools/maigret/maigret.py username
python3 ~/osint-tools/maigret/maigret.py username -v
```

### **📧 Holehe**

```bash
python3 ~/osint-tools/holehe/holehe.py email@example.com
python3 ~/osint-tools/holehe/holehe.py email@example.com --json
```

### **📱 GHunt**

```bash
python3 ~/osint-tools/GHunt/ghunt.py email@example.com
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

**Access:** http://localhost:5001 for web interface

---

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

[GAMING]
INSTALL_STEAM=true
INSTALL_LUTRIS=true
INSTALL_HEROIC=true
ENABLE_GAMEMODE=true
ENABLE_VULKAN=true
```

## 📝 Notes

- ✅ Support for openSUSE Leap and Tumbleweed
- ✅ Automatic gaming optimization
- ✅ Backward compatibility maintained
- ✅ Security and OSINT tools included
- ⚠️ Reboot recommended after Docker

## 📄 License

MIT - See [LICENSE](../LICENSE)