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

## 📋 Description
Collection of automated scripts for installing essential programs on different Linux distributions, including compilers, development tools, browsers, code editors, and games.

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
- **Languages:** Java (OpenJDK), Node.js
- **Version Control:** Git
- **Editors:** VSCode, Cursor (AI)

### 🌐 **Browsers**
- **Google Chrome** - Main browser
- **Brave Browser** - Privacy-focused browser
- **Firefox** - Alternative browser

### 🎵 **Multimedia**
- **Spotify** - Music streaming
- **Osu!** - Rhythm game

### 🛠️ **Tools**
- **AnyDesk** - Remote access
- **Huion Tablet Driver** - Graphics tablet support

## 🚀 How to Use

### **openSUSE:**
```bash
# Download and run
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/opensuse/install-programs.sh
chmod +x install-programs.sh
./install-programs.sh
```

### **Debian/Ubuntu:**
```bash
# Download and run
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/debian/install-programs-debian.sh
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📁 Project Structure
```
linux-install-scripts/
├── opensuse/
│   ├── install-programs.sh
│   └── README.md
├── debian/
│   ├── install-programs-debian.sh
│   └── README.md
├── README.md
└── README-EN.md
```

## 🔧 Features

### **Automatic Installation:**
- ✅ Required repositories
- ✅ GPG keys
- ✅ System dependencies
- ✅ Main programs
- ✅ Basic configurations

### **Included Configurations:**
- ✅ Java with intelligent fallback
- ✅ Git with authentication
- ✅ Icons for applications
- ✅ VSCode extensions

## 🔧 Automatic Configurations
- **Java** configured as default alternative
- **Git** with authentication configuration
- **Icons** for custom applications
- **VSCode extensions** installed automatically

## 📊 Compatibility

### **openSUSE:**
- ✅ **openSUSE Leap 15.3+**
- ✅ **openSUSE Tumbleweed**
- ✅ **SUSE Linux Enterprise**

### **Debian/Ubuntu:**
- ✅ **Debian 11+** (Bullseye, Bookworm)
- ✅ **Ubuntu 20.04+** (LTS and non-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Characteristics
- **Automatic installation** of all programs
- **Intelligent configuration** of dependencies
- **Robust fallback** for different versions
- **Automatic cleanup** of conflicts
- **User-friendly interface** with visual progress

## 📝 Notes
- Scripts automatically detect the distribution
- Install only programs that are not present
- Automatically configure Java alternatives
- Create custom icons for applications

## 🔗 Useful Links
- **Repository:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentation:** Specific READMEs in each folder

## 📄 License
This project is under the MIT license. See the LICENSE file for more details.

---
**🎉 Developed to facilitate the configuration of development environments on different Linux distributions!**
