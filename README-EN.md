<!-- Markdown version -->
# Linux Installation Scripts

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.1--stable-green.svg" alt="Version">
  <img src="https://img.shields.io/badge/Linux-Supported-brightgreen.svg" alt="Linux">
  <img src="https://img.shields.io/badge/Debian-11%20%7C%2012%20%7C%2013-A80030?logo=debian" alt="Debian">
  <img src="https://img.shields.io/badge/Ubuntu-20.04%2B-E95420?logo=ubuntu" alt="Ubuntu">
  <img src="https://img.shields.io/badge/openSUSE-Supported-35B44A?logo=opensuse" alt="openSUSE">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License">
</p>

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md) *(Current)*
- [🇧🇷 Português](README.md)

## 📋 Description

Collection of automated scripts for installing essential programs on different Linux distributions, including compilers, development tools, AI tools, browsers, code editors, and applications.

## ✅ Supported Distributions

### **openSUSE**
- ✅ **openSUSE Leap 15.3+**
- ✅ **openSUSE Tumbleweed**
- ✅ **SUSE Linux Enterprise**

### **Debian/Ubuntu**
- ✅ **Debian 11+** (Bullseye, Bookworm, Trixie)
- ✅ **Ubuntu 20.04+** (LTS and non-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Available Scripts

### **🖥️ Automatic Installation (Recommended):**
```bash
# Automatic distribution detection
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts
./auto-install.sh
```

### **📋 Manual Installation by Distribution:**

| Distribution | Script | Status |
|--------------|--------|--------|
| **Debian/Ubuntu** | `debian/install-programs-debian.sh` | ✅ Stable v1.1 |
| **openSUSE** | `opensuse/install-programs-opensuse.sh` | ✅ Stable v1.1 |

### **🗑️ Uninstallation:**
```bash
./uninstall.sh
```

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

## 🎯 Key Features

### **🚀 Smart Installation:**
- ✅ Automatic Linux distribution detection
- ✅ Selective installation - only non-installed programs
- ✅ Robust fallback - multiple sources (repositories, Flatpak, Snap, AppImage)
- ✅ Automatic cleanup of repository conflicts
- ✅ Informative messages throughout the process

### **🤖 AI Tools (v1.1-stable):**
- ✅ Cursor - AI Code Editor
- ✅ Antigravity - AI tool via Python/PIP
- ✅ Claude Code - Official Anthropic CLI for AI-assisted software engineering
- ✅ OpenCode - Development extensions

### **🖥️ System Tools:**
- ✅ Fastfetch/Neofetch - System information (automatic detection)
- ✅ yt-dlp - Video download
- ✅ Docker and Docker Compose - Containerization

### **🔒 Security & OSINT:**
- ✅ Nmap, Wireshark, John the Ripper, Hydra, Aircrack-ng
- ✅ SQLMap, Nikto, Hashcat, Gobuster, ffuf
- ✅ SpiderFoot, Sherlock, theHarvester, GHunt, Holehe, Maigret, PhoneInfoga

### **🎮 Gaming Optimization:**
- ✅ Steam, Lutris, Heroic, Osu!, WinBoat
- ✅ GameMode, DXVK, Vulkan (backward compatible)
- ✅ GPU and Memory optimization

### **🔧 Automatic Configuration:**
- ✅ Docker and Docker Compose with user in docker group
- ✅ Official Huion Driver for tablets
- ✅ WireGuard VPN
- ✅ Automatic TRIM for SSDs
- ✅ Java, Git, Node.js automatically configured

## 📖 Quick Usage Guides

### **📂 OSINT Tools Location**

OSINT and Security tools are installed in:
```
~/osint-tools/
```

**Globally available tools:**
- `sherlock`, `maigret`, `holehe` → Run via `python3 ~/osint-tools/tool.py`
- `theHarvester` → Available globally via pip
- `sf` (SpiderFoot) → Available globally via pip

---

### **🔎 Sherlock - Username Search**

```bash
# Basic search
python3 ~/osint-tools/sherlock/sherlock.py username

# JSON output
python3 ~/osint-tools/sherlock/sherlock.py username --json

# Save results
python3 ~/osint-tools/sherlock/sherlock.py username --output results.txt
```

### **🕷️ SpiderFoot - Automated OSINT**

```bash
# Start web interface (port 5001)
sf -s 127.0.0.1

# CLI
sfcli -s example.com -M sfp_arin -M sfp_dnsresolv
```
**Access:** http://localhost:5001 for web interface

### **🎯 Maigret - Advanced Username Search**

```bash
# Detailed search
python3 ~/osint-tools/maigret/maigret.py username

# With screenshots
python3 ~/osint-tools/maigret/maigret.py username -v
```

### **📞 PhoneInfoga - Phone OSINT**

```bash
# Basic scan
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999

# Full scan
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 -i
```

### **🛡️ Nmap - Network Scanner**

```bash
# Basic scan
nmap 192.168.1.1

# Full scan with service detection
nmap -sV -sC -p- 192.168.1.1

# Scan entire network
nmap -sP 192.168.1.0/24
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

### **🔓 Hydra - Brute Force**

```bash
# SSH brute force
hydra -l user -P wordlist.txt ssh://192.168.1.1

# HTTP POST
hydra -l admin -P wordlist.txt 192.168.1.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=incorrect"
```

---

## 🧠 Fallback Intelligence

### **Fastfetch / Neofetch**

The script automatically detects the operating system and installs the most appropriate system information tool:

| System | Tool |
|--------|------|
| **Debian 13+** | Fastfetch |
| **Ubuntu 24.04+** | Fastfetch |
| **Debian 11/12** | Neofetch (fallback) |
| **Ubuntu 20.04/22.04** | Neofetch (fallback) |
| **openSUSE** | Fastfetch |

**Implemented logic:**
```bash
source /etc/os-release
if [[ "$ID" == "debian" && "${VERSION_ID%%.*}" -ge 13 ]] || [[ "$ID" == "ubuntu" && "${VERSION_ID%%.*}" -ge 24 ]]; then
    apt_install fastfetch
else
    apt_install neofetch
fi
```

---

## 📝 Important Notes

- ✅ Scripts tested and functional (v1.1-stable)
- ✅ Backward compatibility with Debian 11, Ubuntu 20.04+
- ✅ Full Debian 13 (Trixie) support
- ✅ AI Tools: Cursor, Antigravity, Claude Code
- ✅ Smart fallback for Fastfetch/Neofetch
- ⚠️ Reboot recommended after Docker and Huion Driver

## 📄 License

This project is under MIT license. See [LICENSE](LICENSE) for more details.

---

**🎉 Scripts developed to facilitate development environment setup on Linux!**