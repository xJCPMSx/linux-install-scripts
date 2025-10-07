# Automatic Installation Script - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![Linux Mint](https://img.shields.io/badge/Linux%20Mint-Supported-green.svg)](https://linuxmint.com/)
[![Kali](https://img.shields.io/badge/Kali-Supported-purple.svg)](https://www.kali.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md) *(Current)*
- [🇧🇷 Português](README.md)

## 📋 Description

Automated script for installing essential programs on Debian/Ubuntu-based systems, including compilers, development tools, browsers, code editors, and applications.

## 🎯 Installed Programs

### 🔧 **Development Tools**
- **Compilers:** GCC, G++, Make, CMake, Ninja
- **Languages:** Java (OpenJDK), Node.js, npm
- **Version Control:** Git with SSH
- **Editors:** VSCode (with extensions), Cursor (AI-powered editor)

### 🌐 **Browsers**
- **Google Chrome** - Main browser
- **Brave Browser** - Privacy-focused browser (via Flatpak)
- **Firefox** - Alternative browser

### 🎮 **Gaming Platforms**
- **Steam** - Largest PC gaming platform
- **Lutris** - Game manager (Steam, GOG, Epic, Emulators, etc.)
- **Heroic Games Launcher** - Client for Epic Games Store and GOG
- **Osu!** - Rhythm game (configured for Huion tablets)

### 🎵 **Multimedia**
- **Spotify** - Music streaming (via multiple sources)
- **yt-dlp** - Video download

### 🛠️ **Tools**
- **AnyDesk** - Remote access (.deb official)
- **Docker & Docker Compose** - Containerization
- **Official Huion Driver** - Graphics tablet driver
- **WireGuard** - Modern and secure VPN

## 🚀 How to Use

### **Quick Installation:**
```bash
cd debian
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📋 Prerequisites
- **System:** Debian 11+, Ubuntu 20.04+, or derivatives
- **Permissions:** Sudo access
- **Connection:** Stable internet

## 🔧 Features

### **Automatic Installation:**
- ✅ Required repositories
- ✅ GPG keys
- ✅ System dependencies
- ✅ Main programs
- ✅ Basic configurations
- ✅ Enhanced verification - detects apps via command, dpkg, flatpak, snap
- ✅ New OSINT tool - Holehe for email verification

### **Included Configurations:**
- ✅ Java as default alternative
- ✅ Git with authentication
- ✅ SSH keys for GitHub/GitLab
- ✅ Docker without sudo
- ✅ VSCode extensions
- ✅ Desktop icons

## 🎮 Osu! - Rhythm Game

### **🔧 Automatic Installation:**
- **Downloaded** to `~/Applications/osu.AppImage`
- **Desktop icon** automatically created
- **Executable permission** configured
- **Game launcher** in applications menu

### **💡 How to Use:**
```bash
# Run Osu!
~/Applications/osu.AppImage

# Or search "osu!" in applications menu
```

### **🎨 Configuration with Huion Tablet:**
For best performance with Huion tablets:
1. Open Official Huion Driver
2. Configure tablet in driver
3. In Osu!: **Options → Input → Raw Input: OFF**
4. Works perfectly!

### **⚠️ Important:**
- Official Huion driver is recommended for osu!
- Configure **Raw Input: OFF** in osu! settings
- Driver is automatically installed by this script

## 🐳 Docker and Docker Compose

### **🔧 Automatic Installation:**
- **Official Docker repository** configured
- **Docker Engine** - Latest stable version
- **Docker Compose** - Integrated with Docker (v2)
- **Automatic initialization** - Docker service starts at boot
- **User configuration** - Added to docker group (no sudo needed)

### **💡 How to Use:**
```bash
# Check version
docker --version
docker compose version

# Run a container
docker run hello-world

# Using Docker Compose
docker compose up -d
```

### **⚠️ Important:**
After installation, **log out and log in** for Docker to work without sudo.

## 🎨 Official Huion Driver

### **🔧 Automatic Installation:**
- **Driver files** included in repository (`debian/huion/`)
- **Installation script** embedded in main script
- **No external downloads needed**
- **udev rules** configured automatically
- **Desktop icon** created in applications menu
- **User added** to `dialout` group

### **💡 How to Use:**
```bash
# Search "Huion Tablet" in applications menu
# Configure your tablet settings
# Compatible with all recent Huion models
```

### **🎮 Configuration for Osu!:**
For best performance in games like Osu!:
- Open Huion driver from applications menu
- Configure pressure and shortcut keys
- In Osu!: **Raw Input: OFF**
- Perfect tablet performance!

### **⚠️ Note about compatibility:**
Official Huion driver installed for better compatibility with Huion tablets.
For games like osu!, set **Raw Input: OFF** in game settings.

## 📺 yt-dlp - Video Download

### **🔧 Installation:**
- **youtube-dl successor** more updated and maintained
- **Multi-platform support** (YouTube, Vimeo, Twitch, SoundCloud, etc.)
- **Installation via pip** (always latest version)

### **💡 Basic Usage:**
```bash
# Download video
yt-dlp "https://www.youtube.com/watch?v=VIDEO_ID"

# Download audio only (MP3)
yt-dlp -x --audio-format mp3 "VIDEO_URL"

# Download at specific quality
yt-dlp -f "best[height<=720]" "VIDEO_URL"

# Download complete playlist
yt-dlp "PLAYLIST_URL"
```

## 🔒 WireGuard - Modern VPN

### **🔧 Automatic Installation:**
- **wireguard** and **wireguard-tools** - Complete packages
- **Modern and fast** - Uses latest cryptographic algorithms
- **Easy configuration** - Simple setup files
- **Automatic startup** - Can be configured to start at boot

### **💡 Basic Usage:**
```bash
# Generate keys
sudo wg genkey | tee privatekey | wg pubkey > publickey

# Configuration file: /etc/wireguard/wg0.conf
# Edit with your configuration:
sudo nano /etc/wireguard/wg0.conf

# Start VPN
sudo wg-quick up wg0

# Stop VPN
sudo wg-quick down wg0

# Check status
sudo wg show

# Enable at boot
sudo systemctl enable wg-quick@wg0
```

### **📋 Configuration Example:**
```ini
[Interface]
PrivateKey = YOUR_PRIVATE_KEY
Address = 10.0.0.2/24
DNS = 1.1.1.1

[Peer]
PublicKey = SERVER_PUBLIC_KEY
Endpoint = vpn.example.com:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

### **🔗 More Information:**
- [Official WireGuard documentation](https://www.wireguard.com/)
- Configuration: `/etc/wireguard/`
- Modern replacement for OpenVPN

## ⚙️ Custom Configuration

The script detects existing installations and doesn't reinstall:
- Programs already installed
- Repositories already added
- Configurations already made

## 🔍 Verification

After installation, verify:
```bash
# Java
java -version

# Node.js
node -v
npm -v

# Git
git --version

# Docker
docker --version

# WireGuard
wg --version
```

## 🛠️ Manual Configurations

### **Git:**
```bash
# If not configured automatically
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### **SSH Keys:**
```bash
# If not created automatically
ssh-keygen -t ed25519 -C "your.email@example.com"
```

## 🎯 What to Do After Installation

1. **Restart the system** to ensure all drivers work correctly
2. **Configure Git** with your credentials (if needed)
3. **Test installed programs**
4. **Icons** for Cursor, Osu!, and Huion Tablet will appear in menu after restarting graphical environment
5. **To use Docker without sudo**, log out and log in again
6. **Configure Official Huion Driver** for your graphics tablet (recommended for osu!)

## 📞 Support and Information

- 🔗 **Repository**: https://github.com/xJCPMSx/linux-install-scripts
- 📋 **Issues**: https://github.com/xJCPMSx/linux-install-scripts/issues
- 📖 **Full Documentation**: ../README.md

## 📝 License

MIT License - See [LICENSE](../LICENSE) file for details

---

**Made with ❤️ for the Debian/Ubuntu community**
