# Linux Installation Scripts

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-11%2B-13%2B-A80030?style=flat&logo=debian)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-E95420?style=flat&logo=ubuntu)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

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
- ✅ **Debian 11+** (Bullseye, Bookworm, **Trixie**)
- ✅ **Ubuntu 20.04+** (LTS and non-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Available Scripts

### **🖥️ Automatic Installation:**
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
| **openSUSE** | `opensuse/install-programs-opensuse.sh` | ✅ Stable |

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
- ✅ Antigravity - AI tool via Python/PIP
- ✅ Claude Code - Official Anthropic CLI
- ✅ OpenCode - Development extensions

### **🔒 Security & OSINT:**
- ✅ Nmap, Wireshark, John, Hydra, Aircrack-ng
- ✅ SQLMap, Nikto, Hashcat, Gobuster, ffuf
- ✅ SpiderFoot, Sherlock, theHarvester, GHunt, Holehe

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

## 📝 Important Notes

- ✅ Scripts tested and functional
- ✅ Backward compatibility with Debian 11, Ubuntu 20.04+
- ✅ Full Debian 13 (Trixie) support
- ⚠️ Reboot recommended after Docker and Huion Driver

## 📄 License

This project is under MIT license. See [LICENSE](LICENSE) for more details.

---

**🎉 Scripts developed to facilitate development environment setup on Linux!**