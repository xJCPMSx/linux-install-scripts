# Automatic Installation Script - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-11%2B-13%2B-A80030?style=flat&logo=debian)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-E95420?style=flat&logo=ubuntu)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md) *(Current)*
- [🇧🇷 Português](README.md)

## 📋 Description

Automated script for installing essential programs on Debian/Ubuntu-based systems, including compilers, development tools, AI tools, browsers, code editors, and applications.

## ✅ Supported Distributions

- **Debian:** 11 (Bullseye), 12 (Bookworm), 13 (Trixie)
- **Ubuntu:** 20.04+, 22.04+, 24.04+
- **Linux Mint:** 20+
- **Pop!_OS:** 20.04+
- **Elementary OS:** 6+
- **Zorin OS:** 16+
- **Kali Linux:** Rolling

## 🎯 Installed Programs

### 🤖 **AI Tools (New in v1.1-stable)**
- **Antigravity** - AI tool via Python/PIP
- **Claude Code** - Official Anthropic CLI for AI-assisted software engineering
- **OpenCode** - Development extensions (optional)

### 🔧 **Development Tools**
- **Compilers:** GCC, G++, Make, CMake, Ninja, build-essential
- **Languages:** Java (OpenJDK with automatic fallback), Node.js, npm, Python3, pip
- **Version Control:** Git
- **Editors:** VSCode (via Flatpak), Cursor (AppImage - AI-powered editor)

### 🌐 **Browsers**
- **Google Chrome** - Main browser (.deb official)
- **Brave Browser** - Privacy-focused browser (via Flatpak)
- **Firefox** - Alternative browser

### 🎮 **Gaming Platforms & Optimization**
- **Steam** - Largest PC gaming distribution platform
- **Lutris** - Game manager (Steam, GOG, Epic, Emulators, etc.)
- **Heroic Games Launcher** - Client for Epic Games Store and GOG
- **Osu!** - Rhythm game (AppImage)
- **WinBoat** - Run Windows apps on Linux
- **GameMode** - Performance optimization for games
- **DXVK** - DirectX to Vulkan compatibility
- **Vulkan** - Modern graphics API (backward compatible with Debian 11/12)

### 🎵 **Multimedia**
- **Spotify** - Music streaming (Flatpak→Snap→Repository with fallback)
- **yt-dlp** - Video downloader (youtube-dl successor)

### 🛠️ **Tools & Drivers**
- **AnyDesk** - Remote desktop (.deb official)
- **Docker and Docker Compose** - Containerization
- **Official Huion Driver** - Driver for Huion tablets (Kamvas, Inspiroy, etc.)
- **WireGuard** - Modern and secure VPN
- **FreeRDP 3** - Modern RDP protocol (essential for WinBoat on Debian 13)
- **Fastfetch** - System information tool (default on Debian 13, fallback to Neofetch on older systems)

### 🔒 **Security & OSINT (Kali Linux Tools)**
- **Nmap** - Network scanner
- **Wireshark** - Packet analyzer
- **John the Ripper** - Password cracker
- **Hydra** - Brute force
- **Aircrack-ng** - WiFi security
- **SQLMap** - SQL Injection
- **Nikto** - Web scanner
- **Hashcat** - Hash cracker
- **Gobuster** - Directory/DNS bruteforce
- **ffuf** - Web fuzzing
- **SpiderFoot** - OSINT automation
- **Sherlock** - Username search on social networks
- **theHarvester** - Email and information gathering
- **GHunt** - Google account OSINT
- **PhoneInfoga** - Phone number OSINT
- **Maigret** - Advanced username search
- **Holehe** - Email verification on 120+ sites

## 🚀 How to Use

### **🎯 Automatic Installation (Recommended):**
```bash
# Clone the repository
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts

# Automatic detection (runs Debian/Ubuntu script)
./auto-install.sh
```

### **🖥️ Graphical Interface:**
```bash
# Interactive graphical interface
./gui-install.sh
```

### **📋 Manual Installation:**
```bash
# Run specific Debian/Ubuntu script
cd debian
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📋 Prerequisites

- **System:** Debian 11+, Ubuntu 20.04+, Linux Mint 20+, Pop!_OS 20.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissions:** sudo access
- **Connection:** Stable internet
- **Space:** ~3GB for complete installation

## 🎯 Key Features

### **🚀 Smart Installation:**
- ✅ **Automatic detection** of Debian/Ubuntu distribution
- ✅ **Full Debian 13 (Trixie) support** with GPG and repository fixes
- ✅ **Selective installation** - only non-installed programs
- ✅ **Robust fallback** - multiple sources (repositories, Flatpak, Snap, AppImage, .deb)
- ✅ **Backward compatibility** - maintains support for Debian 11, Ubuntu 20.04+
- ✅ **Automatic cleanup** of repository conflicts
- ✅ **Informative messages** throughout the process

### **🔧 Automatic Configuration:**
- ✅ **Official repositories** added (Chrome, Docker, etc.)
- ✅ **GPG keys** imported automatically
- ✅ **Java** with automatic multiple fallback
- ✅ **Git** prepared for SSH usage
- ✅ **Docker** with user added to docker group
- ✅ **VSCode extensions** installed automatically
- ✅ **Automatic optimization** for games (GameMode, DXVK, Vulkan)
- ✅ **TRIM automatically enabled** for SSDs
- ✅ **Unnecessary services disabled** (bluetooth, cups, avahi-daemon)

## 🗂️ Project Structure

```
.
├── auto-install.sh           # Automatic distribution detection
├── CHANGELOG.md              # Version history
├── config/
│   └── config.conf           # Customizable settings
├── debian/
│   ├── huion/                # Official Huion driver
│   ├── install-programs-debian.sh
│   ├── README-EN.md
│   └── README.md
├── docker/
│   ├── docker-compose.yml
│   └── Dockerfile
├── gui-install.sh            # Graphical interface
├── LICENSE
├── opensuse/
│   ├── huion/
│   ├── install-programs-opensuse.sh
│   ├── README-EN.md
│   └── README.md
├── README-EN.md
├── README.md
└── uninstall.sh              # Uninstallation script
```

## 🐳 Docker and Docker Compose

### **🔧 Automatic Installation:**
- **Docker CE** installed via official repository
- **Docker Compose** available as plugin (`docker compose`)
- **User added to docker group** (use without sudo after reboot)
- **Service enabled and started** automatically

### **💡 How to Use:**
```bash
# Check installation
docker --version
docker compose version

# Run test container
docker run hello-world
```

**⚠️ Important:** Log out/login (or reboot) after installation to use Docker without sudo.

## 🎮 Official Huion Driver

### **🔧 Automatic Installation:**
- **Official driver** included in repository (`debian/huion/`)
- **Integrated installation** in script
- **Icon created** in application menu
- **udev rules** configured automatically
- **Better compatibility** with Huion tablets

### **💡 Supported Models:**
- INSPIROY H430P, H640P, H950P, H1060P
- KAMVAS GT-191, GT-221, Pro 16, Pro 22, Pro 24
- And many other Huion models

### **📝 How to Use:**
```bash
# After installation, look for "Huion Tablet" in application menu
# Configure work area, buttons and sensitivity
# For osu!: configure Raw Input: OFF in game settings
```

**⚠️ Important:** Restart the system after driver installation for proper functioning.

## 📺 yt-dlp - Video Download

### **🔧 Installation:**
- **youtube-dl successor** more updated and maintained
- **Multi-platform support** (YouTube, Vimeo, Twitch, SoundCloud, etc.)
- **Installation via pip** (always the latest version)

### **💡 Basic Usage:**
```bash
# Download video
yt-dlp "https://www.youtube.com/watch?v=VIDEO_ID"

# Download audio only (MP3)
yt-dlp -x --audio-format mp3 "VIDEO_URL"

# Download specific quality
yt-dlp -f "best[height<=720]" "VIDEO_URL"

# Download full playlist
yt-dlp "PLAYLIST_URL"
```

## 🔒 WireGuard - Modern VPN

### **🔧 Automatic Installation:**
- **Modern, fast and secure VPN**
- **Simplified configuration** compared to OpenVPN
- **Automatically installed** via apt (wireguard wireguard-tools)
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

# Enable on boot
sudo systemctl enable wg-quick@wg0

# Check status
sudo wg show
```

## 🔐 Security Tools - Complete Guide

### **🛡️ Nmap - Network Scanner**

Nmap is the standard tool for network reconnaissance and port scanning.

```bash
# Basic port scan
nmap 192.168.1.1

# Scan specific ports
nmap -p 22,80,443 192.168.1.1

# Full scan with service/version detection
nmap -sV -sC -p- 192.168.1.1

# Scan entire network
nmap -sP 192.168.1.0/24

# Stealthy (SYN) scan
nmap -sS 192.168.1.1

# UDP scan
nmap -sU 192.168.1.1

# OS detection
nmap -O 192.168.1.1

# Output to file
nmap -oN scan.txt 192.168.1.1
```

### **📡 Wireshark - Packet Analyzer**

Capture and analyze network traffic in real time.

```bash
# Start Wireshark (graphical mode)
sudo wireshark

# Capture on specific interface
sudo wireshark -i eth0

# Capture with specific filter
sudo wireshark -i eth0 -f "port 80"

# Save capture to file
sudo wireshark -i eth0 -w capture.pcap

# CLI analysis (tshark)
sudo tshark -i eth0 -c 100
```

### **🔓 Hydra - Brute Force**

Brute force tool for authentication testing.

```bash
# SSH brute force
hydra -l user -P wordlist.txt ssh://192.168.1.1

# HTTP POST brute force
hydra -l admin -P wordlist.txt 192.168.1.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=incorrect"

# FTP brute force
hydra -l ftp -P wordlist.txt ftp://192.168.1.1

# MySQL brute force
hydra -l root -P wordlist.txt 192.168.1.1 mysql

# Use user file
hydra -L users.txt -P wordlist.txt ssh://192.168.1.1
```

### **💉 SQLMap - SQL Injection**

Automates detection and exploitation of SQL Injection vulnerabilities.

```bash
# Test URL for SQLi
sqlmap -u "http://target.com/page.php?id=1"

# Enumerate databases
sqlmap -u "http://target.com/page.php?id=1" --dbs

# List tables in database
sqlmap -u "http://target.com/page.php?id=1" -D db_name --tables

# Dump data from table
sqlmap -u "http://target.com/page.php?id=1" -D db_name -T users --dump

# Get interactive shell
sqlmap -u "http://target.com/page.php?id=1" --os-shell

# Use Tor for anonymity
sqlmap -u "http://target.com/page.php?id=1" --tor --tor-type=SOCKS5
```

## 🔍 OSINT Tools - Complete Guide

### **📂 Tool Locations**

OSINT tools are installed in `~/osint-tools/` and available via PATH:

```
~/osint-tools/
├── sherlock/          # Sherlock
├── theHarvester/     # theHarvester
├── maigret/           # Maigret
├── holehe/            # Holehe
├── GHunt/             # GHunt
├── phoneinfoga/       # PhoneInfoga
└── spiderfoot/        # SpiderFoot
```

**Globally available tools:**
- Sherlock, Maigret, Holehe: `python3 ~/osint-tools/tool.py`
- theHarvester: `theHarvester` (global via pip)
- SpiderFoot: `sf` (global via pip)

### **🔎 Sherlock - Username Search**

Find accounts on social networks by username.

```bash
# Basic search
python3 ~/osint-tools/sherlock/sherlock.py username

# JSON output
python3 ~/osint-tools/sherlock/sherlock.py username --json

# Parallel threading
python3 ~/osint-tools/sherlock/sherlock.py username --timeout 1

# Search all networks
python3 ~/osint-tools/sherlock/sherlock.py username --output results.txt
```

### **🌐 theHarvester - Email Collection**

Collect emails, subdomains and IPs from public sources.

```bash
# Basic email collection
theHarvester -d example.com -b google

# Multiple sources
theHarvester -d example.com -b google,bing,linkedin

# Subdomain enumeration
theHarvester -d example.com -b shodan -n

# Save results
theHarvester -d example.com -b all -f results.html

# Limit results
theHarvester -d example.com -b google -l 100
```

### **🎯 Maigret - Advanced Username Search**

Advanced version of Sherlock with more platforms.

```bash
# Basic search
python3 ~/osint-tools/maigret/maigret.py username

# Detailed search with screenshots
python3 ~/osint-tools/maigret/maigret.py username -v

# Without progress bar
python3 ~/osint-tools/maigret/maigret.py username --no-progress

# Save to JSON
python3 ~/osint-tools/maigret/maigret.py username --json -o results.json

# Use proxy
python3 ~/osint-tools/maigret/maigret.py username --proxy socks5://127.0.0.1:9050
```

### **📧 Holehe - Email Verification**

Check if an email exists on 120+ services.

```bash
# Basic verification
python3 ~/osint-tools/holehe/holehe.py email@example.com

# JSON output
python3 ~/osint-tools/holehe/holehe.py email@example.com --json

# Only found services
python3 ~/osint-tools/holehe/holehe.py email@example.com --found

# Custom timeout
python3 ~/osint-tools/holehe/holehe.py email@example.com --timeout 5
```

### **📱 GHunt - Google Account OSINT**

Extract information from Google accounts by email or ID.

```bash
# Email information
python3 ~/osint-tools/GHunt/ghunt.py email@example.com

# Google ID information
python3 ~/osint-tools/GHunt/ghunt.py 1182...ID

# Interactive mode
python3 ~/osint-tools/GHunt/ghunt.py

# Check cookies (required for some functions)
python3 ~/osint-tools/GHunt/ghunt.py --check
```

### **📞 PhoneInfoga - Phone OSINT**

Collect information about phone numbers.

```bash
# Basic scan
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999

# Full reconnaissance
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 -i

# Use VoIP only
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 --use-numverify

# Specific format
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n "+55 11 99999-9999" -f data.json
```

### **🕷️ SpiderFoot - OSINT Automation**

Web interface for automated OSINT.

```bash
# Start web interface (port 5001)
sf -s 192.168.1.1

# CLI module
sfcli -s 192.168.1.1 -m sfp_spider

# Quick scan
sfcli -s example.com -M sfp_arin -M sfp_dnsresolv -M sfp_email

# Export results
sfcli -s example.com -f json > results.json
```

**Access:** http://localhost:5001 for web interface

---

## ⚙️ Custom Configuration

Edit the `../config/config.conf` file to customize installation:

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

Then run:
```bash
./install-programs-debian.sh
```

## 🗑️ Uninstallation

To remove all installed programs:

```bash
# In project root
cd ..
./uninstall.sh
```

## 📝 Important Notes

- ✅ **Smart installation** - Detects already installed programs
- ✅ **Multiple attempts** - Tries different installation methods
- ✅ **Backward compatibility** - Support for Debian 11, Ubuntu 20.04+
- ✅ **Debian 13 (Trixie) support** - Complete repository and GPG fixes
- ✅ **Fastfetch** as default (Neofetch fallback on older systems)
- ✅ **FreeRDP 3** - Debian 13 compatibility
- ⚠️ **Reboot recommended** after Docker and Huion Driver installation
- ⚠️ **VSCode:** Installed via Flatpak to avoid conflicts
- ⚠️ **Spotify:** Triple fallback (Flatpak→Snap→Repository)
- ⚠️ **Java:** Automatic multiple fallback

## 🔗 Useful Links

- **Repository:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues

## 📄 License

This project is under MIT license. See [LICENSE](../LICENSE) file for more details.

---

**🎉 Developed to facilitate development environment setup on Debian/Ubuntu-based systems!**