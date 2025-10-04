# Linux Installation Scripts

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md) *(Current)*
- [🇧🇷 Português](README.md)

## ⚠️ **BETA VERSION - TESTING**
This is a beta version for testing. Features may change before the final release.

## 📋 Description
Collection of automated scripts for installing essential programs on different Linux distributions, including compilers, development tools, browsers, code editors, and applications.

## 🐧 Supported Distributions

### **openSUSE**
- **openSUSE Leap 15.3+**
- **openSUSE Tumbleweed**
- **SUSE Linux Enterprise**

### **Debian/Ubuntu**
- **Debian 11+** (Bullseye, Bookworm)
- **Ubuntu 20.04+** (LTS and non-LTS)
- **Linux Mint 20+**
- **Pop!_OS 20.04+**
- **Elementary OS 6+**
- **Zorin OS 16+**
- **Kali Linux Rolling**

## 🎯 Installed Programs

### 🔧 **Development Tools**
- **Compilers:** GCC, G++, Make, CMake, Ninja
- **Languages:** Java (OpenJDK), Node.js, npm
- **Version Control:** Git with SSH
- **Editors:** VSCode, Cursor (AI-powered editor)

### 🌐 **Browsers**
- **Google Chrome** - Main browser
- **Brave Browser** - Privacy-focused browser
- **Firefox** - Alternative browser

### 🎮 **Gaming Platforms**
- **Steam** - Largest PC gaming platform
- **Lutris** - Game manager (Steam, GOG, Epic, Emulators, etc.)
- **Heroic Games Launcher** - Client for Epic Games Store and GOG
- **Osu!** - Rhythm game

### 🎵 **Multimedia**
- **Spotify** - Music streaming (via Flatpak)
- **yt-dlp** - Video downloader (youtube-dl successor)

### 🛠️ **Tools**
- **AnyDesk** - Remote access
- **Docker & Docker Compose** - Containerization
- **Official Huion Driver** - Graphics tablet driver
- **WireGuard** - Modern and secure VPN

## 🚀 How to Use

### **🎯 Automatic Installation (Recommended):**
```bash
# Automatic distribution detection
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/auto-install.sh
chmod +x auto-install.sh
./auto-install.sh
```

### **📋 Manual Installation by Distribution:**

#### **openSUSE:**
```bash
cd opensuse
chmod +x install-programs-opensuse.sh
./install-programs-opensuse.sh
```

#### **Debian/Ubuntu:**
```bash
cd debian
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📁 Project Structure
```
linux-install-scripts/
├── 🎯 auto-install.sh                  # Automatic detection
├── 🗑️ uninstall.sh                     # Uninstallation script
├── 📄 LICENSE                           # MIT License
├── 📋 CHANGELOG.md                     # Version history
├── 📖 README.md                        # Documentation (Portuguese)
├── 📖 README-EN.md                     # Documentation (English)
├── 🔧 config/
│   └── config.conf                     # Configuration
├── 🐳 docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── opensuse/
│   ├── install-programs-opensuse.sh
│   ├── huion/                          # Huion Driver
│   └── README.md
└── debian/
    ├── install-programs-debian.sh
    ├── huion/                          # Huion Driver
    └── README.md
```

## 🔧 Features

### **🎯 Basic Features:**
- ✅ **Automatic detection** - Identifies distribution and runs appropriate script
- ✅ **Smart installation** - Doesn't reinstall existing programs
- ✅ **Multi-distribution support** - openSUSE, Debian, Ubuntu and derivatives
- ✅ **Robust checks** - Detects installations in different ways
- ✅ **Intelligent fallback** - Multiple installation options

### **🔒 Security:**
- ✅ **Automatic GPG verification** - For repositories
- ✅ **Security audit** - Using Snyk and CodeQL
- ✅ **CI/CD** - Automated tests on every commit

## 🎮 Osu! - Rhythm Game

### **🔧 Automatic Installation:**
- **Downloaded** to `~/Applications/osu.AppImage`
- **Desktop icon** automatically created
- **Game launcher** in applications menu
- **Executable permission** configured

### **💡 Basic Usage:**
```bash
# Run Osu!
~/Applications/osu.AppImage

# Or search for "osu!" in applications menu
```

### **🎨 Huion Tablet Configuration:**
- Configure tablet in Huion driver
- In Osu!, set **Raw Input: OFF**
- Works perfectly with official Huion driver

## 🐳 Docker and Docker Compose

### **🔧 Automatic Installation:**
- **Docker Engine** - Latest stable version
- **Docker Compose** - Integrated with Docker
- **Automatic initialization** - Docker service starts at boot
- **User configuration** - No need for sudo

### **💡 Basic Usage:**
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
- **Official driver** from Huion
- **udev rules** configured for USB access
- **Desktop icon** created automatically
- **User added** to `dialout` group

### **💡 How to Use:**
```bash
# Search "Huion Tablet" in applications menu
# Or run:
huiontablet
```

### **🎮 Configuration for Osu!:**
For best performance in games like Osu!:
- Open Huion driver
- Configure pressure and keys
- In Osu!: **Raw Input: OFF**

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
- **wireguard-tools** - Complete package
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

## ⚙️ Custom Configuration

Edit the `config/config.conf` file to customize the installation:
- Select which programs to install
- Configure repositories
- Set preferred versions
- Define custom paths

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Open issues
- Submit pull requests
- Suggest new features
- Report bugs
- Improve documentation

## 📞 Support and Information

- 🔗 **Repository**: https://github.com/xJCPMSx/linux-install-scripts
- 📋 **Issues**: https://github.com/xJCPMSx/linux-install-scripts/issues
- 📖 **Full Documentation**: README.md
- 💬 **Discussions**: GitHub Discussions

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details

## 🙏 Acknowledgments

Thanks to all contributors and the open source community!

---

**⚠️ Note:** This is beta software. Test in a non-production environment first.

**Made with ❤️ for the Linux community**
