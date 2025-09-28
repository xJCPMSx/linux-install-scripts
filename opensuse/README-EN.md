# Automatic Installation Script - openSUSE

[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Leap](https://img.shields.io/badge/Leap-15.3+-green.svg)](https://www.opensuse.org/)
[![Tumbleweed](https://img.shields.io/badge/Tumbleweed-Supported-blue.svg)](https://www.opensuse.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 📋 Description
Automated script for installing essential programs on openSUSE, including compilers, development tools, browsers, code editors, and games.

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

### **Quick Installation:**
```bash
# Download the script
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/opensuse/install-programs.sh

# Make executable
chmod +x install-programs.sh

# Execute
./install-programs.sh
```

### **Manual Installation:**
```bash
# Clone the repository
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts/opensuse

# Execute
./install-programs.sh
```

## 📋 Prerequisites
- **System:** openSUSE Leap 15.3+ or Tumbleweed
- **Permissions:** Sudo access
- **Connection:** Stable internet

### **🖥️ Graphical Interface:**
```bash
# Interactive graphical interface (in project root)
../gui-install.sh
```

## 🔧 Features

### **Automatic Installation:**
- ✅ Required repositories
- ✅ GPG keys
- ✅ System dependencies
- ✅ Main programs
- ✅ Basic configurations

### **Included Configurations:**
- ✅ Java as default alternative
- ✅ Git with authentication
- ✅ Icons for Cursor and Osu!
- ✅ VSCode extensions

## 🎯 Main Characteristics
- **Automatic installation** of all programs
- **Intelligent configuration** of dependencies
- **Robust fallback** for different versions
- **Automatic cleanup** of conflicts
- **User-friendly interface** with visual progress
- **Java** configured as default alternative
- **Git** with authentication configuration
- **Icons** for custom applications
- **VSCode extensions** installed automatically

## 📝 Notes
- The script automatically detects the openSUSE version
- Installs only programs that are not present
- Automatically configures Java alternatives
- Creates custom icons for applications

## 🔗 Useful Links
- **Repository:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentation:** This README

## 📄 License
This project is under the MIT license. See the LICENSE file for more details.

---
**🎉 Developed to facilitate the configuration of development environments on openSUSE!**
