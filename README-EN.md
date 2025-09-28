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

### **🎯 Automatic Installation (Recommended):**
```bash
# Automatic distribution detection
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/auto-install.sh
chmod +x auto-install.sh
./auto-install.sh
```

### **🖥️ Graphical Interface (GUI):**
```bash
# Interactive graphical interface (auto-detects zenity/kdialog)
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/gui-install.sh
chmod +x gui-install.sh
./gui-install.sh
```

### **📋 Manual Installation by Distribution:**

#### **openSUSE:**
```bash
# Download and run
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/opensuse/install-programs.sh
chmod +x install-programs.sh
./install-programs.sh
```

#### **Debian/Ubuntu:**
```bash
# Download and run
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/debian/install-programs-debian.sh
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

### **🗑️ Uninstallation:**
```bash
# Remove all installed programs
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```



### **🐳 Docker:**
```bash
# Build Docker image
docker build -f docker/Dockerfile -t linux-install-scripts .

# Run with Docker Compose
cd docker
docker-compose up -d
```

## 📁 Project Structure
```
linux-install-scripts/
├── 🎯 auto-install.sh          # Automatic detection
├── 🗑️ uninstall.sh             # Uninstallation script
├── 📄 LICENSE                   # MIT License
├── 📋 CHANGELOG.md             # Version history
├── 📖 README.md                # Documentation (Portuguese)
├── 📖 README-EN.md             # Documentation (English)
├── 🔧 config/
│   └── config.conf             # Customizable configurations
├── 🖥️ gui-install.sh           # Unified graphical interface
├── 🐳 docker/
│   ├── Dockerfile              # Containerization
│   └── docker-compose.yml      # Orchestration
├── 🔄 .github/workflows/
│   └── ci.yml                  # CI/CD
├── opensuse/
│   ├── install-programs.sh
│   ├── README.md
│   └── README-EN.md
└── debian/
    ├── install-programs-debian.sh
    ├── README.md
    └── README-EN.md
```

## 🔧 Features

### **🎯 Basic Features:**
- ✅ **Automatic detection** - Identifies distribution and runs appropriate script
- ✅ **Smart installation** - Doesn't reinstall existing programs
- ✅ **Multi-distribution support** - openSUSE, Debian, Ubuntu and derivatives
- ✅ **Robust checks** - Detects installations in different ways
- ✅ **Intelligent fallback** - Multiple installation options

### **⚙️ Custom Configuration:**
- ✅ **Configuration file** - `config/config.conf` for complete control
- ✅ **Program selection** - Choose exactly what to install
- ✅ **Repository settings** - Control software sources
- ✅ **Backup settings** - Customize backup system
- ✅ **Log settings** - Control verbosity and rotation

### **🖥️ Graphical Interface:**
- ✅ **Interactive GUI** - User-friendly interface with Zenity
- ✅ **Program selection** - Choose which programs to install
- ✅ **Advanced settings** - Customizable options
- ✅ **Main menu** - Easy navigation between features
- ✅ **Visual progress** - Progress bar during installation

- ✅ **Troubleshooting** - Facilitates problem resolution

### **🐳 Containerization:**
- ✅ **Docker** - Complete containerization
- ✅ **Docker Compose** - Service orchestration
- ✅ **Multiple environments** - Development, test, production
- ✅ **Exposed ports** - For web development
- ✅ **Isolation** - Controlled environment

### **🔄 CI/CD:**
- ✅ **GitHub Actions** - Automatic testing
- ✅ **Automatic build** - Image construction
- ✅ **Automatic deploy** - Production deployment
- ✅ **Code quality** - Analysis and validation
- ✅ **Security** - Vulnerability checks

### **🖥️ Desktop Integration:**
- ✅ **KDE** - Complete KDE integration
- ✅ **GNOME** - GNOME Shell support
- ✅ **XFCE** - XFCE compatibility
- ✅ **Application menu** - Menu entries
- ✅ **Desktop shortcuts** - Desktop icons

### **⚙️ Configuration:**
- ✅ **Configuration file** - Complete customization
- ✅ **User settings** - Adaptable to needs
- ✅ **Log levels** - Verbosity control
- ✅ **Backup options** - Backup configuration
- ✅ **Interface** - GUI settings

## 🎯 Key Features
- **Automatic distribution detection** and script execution
- **Smart installation** - doesn't reinstall existing programs
- **Multiple installation methods** (repositories, Flatpak, AppImage)
- **Detailed logging** for troubleshooting

## 💡 Usage Examples

### **⚙️ Custom Configuration:**
```bash
# 1. Edit configuration file
nano config/config.conf

# 2. Customize programs to install
[INSTALLATION]
INSTALL_ANYDESK=true      # AnyDesk
INSTALL_SPOTIFY=true       # Spotify
INSTALL_VSCODE=true        # VSCode
INSTALL_CURSOR=false       # Cursor (disabled)
INSTALL_CHROME=true        # Google Chrome
INSTALL_BRAVE=false        # Brave (disabled)
INSTALL_FIREFOX=false      # Firefox (disabled)
INSTALL_JAVA=true          # Java OpenJDK
INSTALL_NODEJS=true        # Node.js
INSTALL_OSU=true           # Osu!
INSTALL_COMPILERS=true     # GCC, G++, Make, CMake
INSTALL_DEVELOPMENT_DEPS=true # Development dependencies

# 3. Run customized installation
./auto-install.sh
```

### **🖥️ Graphical Interface:**
```bash
# Run GUI
./gui-install.sh

# Main menu options:
# 1. 🚀 Automatic Installation
# 2. 📋 List Programs
# 3. 🗑️ Uninstall Programs
# 4. 📊 Statistics
# 5. ❓ Help
# 6. 🚪 Exit
```

### **🐳 Docker:**
```bash
# Build Docker image
docker build -f docker/Dockerfile -t linux-install-scripts .

# Run container
docker run -it linux-install-scripts

# Use Docker Compose
cd docker
docker-compose up -d
```

## 📺 youtube-dl - Video Download

### **🔧 What is youtube-dl:**
- **Command-line tool** for downloading videos
- **Multi-platform support** (YouTube, Vimeo, Twitch, etc.)
- **Automatic installation** in both scripts
- **Audio and video download** in different qualities

### **💡 How to use youtube-dl:**

#### **📥 Basic Commands:**
```bash
# Simple video download
youtube-dl "https://www.youtube.com/watch?v=VIDEO_ID"

# Audio only download (MP3)
youtube-dl -x --audio-format mp3 "VIDEO_URL"

# Download in specific quality
youtube-dl -f best "VIDEO_URL"

# Download complete playlist
youtube-dl "PLAYLIST_URL"
```

#### **🎯 Practical Examples:**
```bash
# Download music from YouTube
youtube-dl -x --audio-format mp3 "https://www.youtube.com/watch?v=dQw4w9WgXcQ"

# Download video in HD
youtube-dl -f "best[height<=720]" "VIDEO_URL"

# Download video with subtitles
youtube-dl --write-sub --sub-lang en "VIDEO_URL"
```

#### **⚙️ Advanced Options:**
- **`-x`** - Extract audio only
- **`--audio-format mp3`** - Audio format
- **`-f best`** - Best available quality
- **`--write-sub`** - Download subtitles
- **`--sub-lang en`** - Subtitle language

## 🔗 Useful Links
- **Repository:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentation:** Specific READMEs in each folder

## 📄 License
This project is under the MIT license. See the LICENSE file for more details.

---
**🎉 Developed to facilitate the configuration of development environments on different Linux distributions!**
