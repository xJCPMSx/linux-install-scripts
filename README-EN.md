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
- **WinBoat** - Run Windows apps natively on Linux
- **Osu!** - Rhythm game

## 🎉 Fun and Useful Tools

- **fortune** - Random quote generator
- **cowsay** - Talking cow (ASCII art)
- **cmatrix** - Matrix effect in terminal
- **nyancat** - Animated rainbow cat

### **Usage Examples:**
```bash
# Random quotes with cow
fortune | cowsay

# Matrix effect
cmatrix

# Animated rainbow cat
nyancat

# Combining tools
fortune | cowsay -f dragon
```

### 🎵 **Multimedia**
- **Spotify** - Music streaming (via Flatpak)
- **yt-dlp** - Video downloader (youtube-dl successor)

### 🎉 **Fun Tools**
- **fortune** - Random quote generator
- **cowsay** - Talking cow (ASCII art)
- **cmatrix** - Matrix effect in terminal
- **nyancat** - Animated rainbow cat

#### **💡 Usage Tips:**
```bash
# Random quotes with cow
fortune | cowsay

# Matrix effect
cmatrix

# Animated rainbow cat
nyancat

# Combining tools
fortune | cowsay -f dragon

# If cowsay freezes terminal, try:
cowsay "short message"
# or use timeout:
timeout 5 cowsay "message"
```

### 🛠️ **Tools**
- **AnyDesk** - Remote access
- **Docker & Docker Compose** - Containerization
- **Official Huion Driver** - Graphics tablet driver
- **WireGuard** - Modern and secure VPN

### 🔒 **Security Tools (Kali Linux)**
- **Nmap** - Advanced network scanner
- **Wireshark** - Network packet analysis
- **John the Ripper** - Password cracking
- **Hydra** - Authentication brute force
- **Aircrack-ng** - WiFi security auditing
- **SQLMap** - SQL injection detection and exploitation
- **Nikto** - Web vulnerability scanner
- **Hashcat** - GPU-accelerated hash cracking
- **Gobuster** - Directory/DNS enumeration
- **ffuf** - Fast web fuzzing

### 🔍 **OSINT Tools**
- **Sherlock** - Username search across 400+ social networks
- **theHarvester** - Email, subdomain, and information gathering
- **Recon-ng** - Complete reconnaissance framework
- **SpiderFoot** - OSINT automation
- **GHunt** - Google account OSINT
- **PhoneInfoga** - Phone number OSINT
- **Maigret** - Advanced username search across 2500+ sites
- **Holehe** - Email verification across 120+ sites

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
- ✅ **Enhanced verification** - Detects apps via command, dpkg, flatpak, snap
- ✅ **New OSINT tool** - Holehe for email verification

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

### **🔧 Automatic Fixes:**
- **KDE** - Automatic fixes for theme issues
- **Flatpak** - Permission optimization for KDE
- **Qt** - Environment variables configuration
- **Aliases** - Automatic command creation (e.g., `spotify`)

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

## 🔒 Security Tools (Kali Linux)

### **🔧 Automatic Installation:**
- **Professional tools** from Kali Linux
- **Penetration testing** and security auditing
- **Automatic installation** of all essential tools
- **Educational:** For learning and authorized ethical testing

### **⚠️ IMPORTANT WARNING:**
> **Ethical Use:** These tools are for educational purposes and testing on authorized systems only. Unauthorized use may be illegal. Use responsibly!

### **💡 Usage Examples:**

#### **Nmap - Network Scanner:**
```bash
# Basic scan
nmap 192.168.1.0/24

# Scan with service detection
nmap -sV 192.168.1.1

# Complete scan
nmap -A -T4 192.168.1.1
```

#### **Wireshark - Packet Analysis:**
```bash
# Start GUI
wireshark

# Command-line capture
tshark -i eth0
```

#### **Hydra - Brute Force:**
```bash
# SSH brute force
hydra -l user -P passwords.txt ssh://192.168.1.1

# FTP brute force
hydra -l admin -P wordlist.txt ftp://192.168.1.1
```

#### **SQLMap - SQL Injection:**
```bash
# Test URL for SQL injection
sqlmap -u "http://example.com/page?id=1" --dbs

# Dump database
sqlmap -u "http://example.com/page?id=1" -D database --dump
```

## 🔍 OSINT Tools

### **🔧 Automatic Installation:**
- **Open Source Intelligence** (OSINT)
- **Tools installed** in `~/osint-tools/`
- **Digital investigation** and reconnaissance
- **Automated collection** of public information

### **💡 Usage Examples:**

#### **Sherlock - Username Search:**
```bash
# Search username on social networks
cd ~/osint-tools/sherlock
python3 sherlock/sherlock.py username

# Save results to file
python3 sherlock/sherlock.py username -o results.txt
```

#### **theHarvester - Email Collection:**
```bash
# Search emails from a domain
cd ~/osint-tools/theHarvester
python3 theHarvester.py -d example.com -b google

# Search multiple sources
python3 theHarvester.py -d example.com -b all
```

#### **Maigret - Advanced Search:**
```bash
# Search username across 2500+ sites
maigret username

# Search with HTML output
maigret username --html

# Search with specific tags
maigret username --tags gaming,social
```

#### **Holehe - Email Verification:**
```bash
# Check if email is registered on sites
holehe email@example.com

# Check multiple emails
holehe email1@example.com email2@example.com

# Use with custom timeout
holehe --timeout 10 email@example.com
```

#### **GHunt - Google OSINT:**
```bash
# Investigate Google email
ghunt email target@gmail.com

# Investigate phone number
ghunt phone +5511999999999
```

#### **PhoneInfoga - Phone OSINT:**
```bash
# Investigate phone number
~/osint-tools/phoneinfoga/phoneinfoga scan -n "+5511999999999"

# Web interface
~/osint-tools/phoneinfoga/phoneinfoga serve
# Access: http://localhost:8080
```

#### **SpiderFoot - OSINT Automation:**
```bash
# Start web interface
cd ~/osint-tools/spiderfoot
python3 sf.py -l 127.0.0.1:5001
# Access: http://127.0.0.1:5001
```

### **📁 Tools Location:**
```
~/osint-tools/
├── sherlock/          # Username search
├── theHarvester/      # Email collection
├── recon-ng/          # Reconnaissance framework
├── spiderfoot/        # OSINT automation
└── phoneinfoga/       # Phone OSINT

# Tools installed via pipx (globally available):
├── holehe/            # Email verification
├── maigret/           # Advanced username search
├── ghunt/             # Google OSINT
└── sqlmap/            # SQL injection
```

## 🪟 WinBoat - Run Windows Apps on Linux

### **🔧 Automatic Installation:**
- **Elegant interface** for running Windows on Linux
- **Automated Windows installation** through the interface
- **Seamless integration** with your Linux desktop
- **Run any app** that works on Windows
- **Open source** (MIT license)

### **💡 Features:**

#### **Elegant Interface:**
- Intuitive interface that integrates Windows into Linux
- Native Linux desktop experience
- Dashboard with all functionalities

#### **Automated Installation:**
- Simple Windows installation process
- Configure preferences and specifications
- Let WinBoat handle the rest

#### **Run Any App:**
- Productivity tools (Office, Adobe Suite)
- Professional applications (Affinity, Acrobat)
- Games that don't work on Wine/Proton
- Windows software in native OS windows

#### **Filesystem Integration:**
- Home directory mounted in Windows
- Easily share files between systems
- Transparent access to your Linux files

#### **Advanced Features:**
- USB passthrough (experimental since v0.8.0)
- Smartcard passthrough
- Resource monitoring
- Peripheral support via USB

### **💡 Basic Usage:**
```bash
# Run WinBoat
~/Applications/WinBoat.AppImage

# Or search for "WinBoat" in applications menu
```

### **📝 Use Cases:**
- **Office 365:** Works perfectly ✅
- **Adobe Suite:** Photoshop, Illustrator, Premiere
- **Affinity:** Photo, Designer, Publisher
- **Paint Tool Sai:** Versions that don't work on Wine
- **AeroChat, Acrobat:** Windows-specific apps

### **🔗 Comparison:**

#### **vs Wine/CrossOver:**
- Runs apps that don't work well on Wine
- Full Windows desktop available
- Better compatibility with Windows software

#### **vs WinApps:**
- Fully automated setup
- Unified and cohesive interface
- Complete experience without manual configuration
- No need to edit configuration files

### **⚠️ Notes:**
- **GPU Passthrough:** Planned for future versions
- **Anti-cheat:** Games with kernel anti-cheat don't work (block virtualization)
- **Podman:** Support planned (currently requires Docker)

### **📖 More Information:**
- Website: https://www.winboat.app/
- GitHub: https://github.com/WinBoat-App/WinBoat
- License: MIT (Open Source)

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details

## 🙏 Acknowledgments

Thanks to all contributors and the open source community!

---

**⚠️ Note:** This is beta software. Test in a non-production environment first.

**Made with ❤️ for the Linux community**
