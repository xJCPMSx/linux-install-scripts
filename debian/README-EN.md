# Automatic Installation Script - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![Linux Mint](https://img.shields.io/badge/Linux%20Mint-Supported-green.svg)](https://linuxmint.com/)
[![Kali](https://img.shields.io/badge/Kali-Supported-purple.svg)](https://www.kali.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 📋 Description
Automated script for installing essential programs on Debian/Ubuntu-based systems, including compilers, development tools, browsers, code editors, and games.

## 🎯 Installed Programs

### 🔧 **Development Tools**
- **Compilers:** GCC, G++, Make, CMake, Ninja
- **Languages:** Java (OpenJDK), Node.js
- **Version Control:** Git
- **Editors:** VSCode (via Flatpak), Cursor (AI)

### 🌐 **Browsers**
- **Google Chrome** - Main browser
- **Brave Browser** - Privacy-focused browser (via Flatpak)
- **Firefox** - Alternative browser

### 🎵 **Multimedia**
- **Spotify** - Music streaming (via Flatpak/snap/repository)
- **Osu!** - Rhythm game (AppImage)

### 🛠️ **Tools**
- **AnyDesk** - Remote access
- **Huion Tablet Driver** - Graphics tablet support

## 🚀 How to Use

### **Quick Installation:**
```bash
# Download the script
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/debian/install-programs-debian.sh

# Make executable
chmod +x install-programs-debian.sh

# Execute
./install-programs-debian.sh
```

### **Manual Installation:**
```bash
# Clone the repository
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts/debian

# Execute
./install-programs-debian.sh
```

## 📋 Prerequisites
- **System:** Debian 11+, Ubuntu 20.04+, Linux Mint 20+, Pop!_OS 20.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissions:** Sudo access
- **Connection:** Stable internet

## 🔧 Features

### **Automatic Installation:**
- ✅ Conflict repository cleanup
- ✅ Required repositories
- ✅ GPG keys
- ✅ System dependencies
- ✅ Main programs
- ✅ Basic configurations

### **Included Configurations:**
- ✅ Java with multiple fallback (11→17→21→default)
- ✅ Git with authentication
- ✅ Icons for Cursor and Osu!
- ✅ VSCode extensions

## 🎯 Main Characteristics
- **VSCode via Flatpak** - Avoids repository conflicts
- **Java with multiple fallback** - 11→17→21→default
- **Spotify with triple fallback** - Flatpak→snap→repository
- **Automatic cleanup** of repository conflicts
- **Robust installation** with intelligent fallbacks
- **Java** with multiple fallback for different versions
- **Git** with authentication configuration
- **Icons** for custom applications
- **VSCode extensions** installed automatically

## 🔧 Troubleshooting
- **Repository conflicts:** Integrated automatic cleanup
- **Java not found:** Fallback for multiple versions
- **Spotify fails:** Multiple installation methods
- **VSCode conflicts:** Installation via Flatpak

## 📝 Notes
- The script automatically detects the distribution
- Installs only programs that are not present
- Automatically configures Java alternatives
- Creates custom icons for applications
- Automatically resolves repository conflicts

## 🔗 Useful Links
- **Repository:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentation:** This README

## 📄 License
This project is under the MIT license. See the LICENSE file for more details.

---
**🎉 Developed to facilitate the configuration of development environments on Debian/Ubuntu-based systems!**
