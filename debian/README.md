# Script de Instalação Automática - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![Linux Mint](https://img.shields.io/badge/Linux%20Mint-Supported-green.svg)](https://linuxmint.com/)
[![Kali](https://img.shields.io/badge/Kali-Supported-purple.svg)](https://www.kali.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição
Script automatizado para instalação de programas essenciais em sistemas baseados em Debian/Ubuntu, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e jogos.

## 🎯 Programas Instalados

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja
- **Linguagens:** Java (OpenJDK), Node.js
- **Controle de Versão:** Git
- **Editores:** VSCode (via Flatpak), Cursor (AI)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (via Flatpak/snap/repositório)
- **Osu!** - Jogo de ritmo (AppImage)

### 🛠️ **Ferramentas**
- **AnyDesk** - Acesso remoto
- **Docker e Docker Compose** - Containerização
- **Driver Oficial da Huion** - Driver oficial para tablets Huion (recomendado para osu!)
- **yt-dlp** - Download de vídeos (sucessor do youtube-dl)

## 🚀 Como Usar

### **🎯 Instalação Automática (Recomendado):**
```bash
# Detecção automática da distribuição
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/auto-install.sh
chmod +x auto-install.sh
./auto-install.sh
```

### **🖥️ Interface Gráfica:**
```bash
# Interface gráfica interativa
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/gui-install.sh
chmod +x gui-install.sh
./gui-install.sh
```

### **📋 Instalação Manual:**
```bash
# Baixar o script
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/debian/install-programs-debian.sh

# Tornar executável
chmod +x install-programs-debian.sh

# Executar
./install-programs-debian.sh
```


### **⚙️ Configuração Personalizada:**
```bash
# Editar arquivo de configuração
nano ../config/config.conf

# Personalizar programas a instalar
[INSTALLATION]
INSTALL_ANYDESK=true      # AnyDesk
INSTALL_SPOTIFY=true       # Spotify
INSTALL_VSCODE=true        # VSCode
INSTALL_CURSOR=false       # Cursor (desabilitado)
INSTALL_CHROME=true        # Google Chrome
INSTALL_BRAVE=false        # Brave (desabilitado)
INSTALL_FIREFOX=false      # Firefox (desabilitado)
INSTALL_JAVA=true          # Java OpenJDK
INSTALL_NODEJS=true        # Node.js
INSTALL_OSU=true           # Osu!
INSTALL_COMPILERS=true     # GCC, G++, Make, CMake
INSTALL_DEVELOPMENT_DEPS=true # Dependências de desenvolvimento

# Executar instalação personalizada
./install-programs-debian.sh
```

### **🖥️ Interface Gráfica:**
```bash
# Interface gráfica interativa (na raiz do projeto)
../gui-install.sh
```


## 📋 Pré-requisitos
- **Sistema:** Debian 11+, Ubuntu 20.04+, Linux Mint 20+, Pop!_OS 20.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- **Detecção automática** da distribuição
- **Instalação seletiva** - apenas programas não presentes
- **Limpeza automática** de conflitos de repositórios
- **Fallback robusto** para diferentes versões
- **Interface amigável** com progresso visual

### **🔧 Configuração Automática:**
- **Java com fallback múltiplo** (11→17→21→default)
- **Git** com autenticação SSH
- **Ícones personalizados** para Cursor e Osu!
- **Extensões VSCode** instaladas automaticamente

### **🛠️ Resolução de Problemas:**
- **VSCode via Flatpak** - Evita conflitos de repositórios
- **Spotify com fallback triplo** - Flatpak→snap→repositório
- **Java não encontrado** - Fallback para múltiplas versões
- **Conflitos de repositórios** - Limpeza automática integrada

## 🐳 Docker e Docker Compose

### **🔧 Instalação Automática:**
- **Docker CE** instalado via repositório oficial
- **Docker Compose V2** como plugin integrado
- **Usuário adicionado ao grupo docker** para uso sem sudo
- **Serviço habilitado** e iniciado automaticamente

### **💡 Como usar:**
```bash
# Verificar instalação
docker --version
docker compose version

# Executar container de teste
docker run hello-world

# Usar Docker Compose
docker compose up -d
```

## 🎮 Driver Oficial da Huion

### **🔧 Instalação Automática:**
- **Driver oficial** instalado automaticamente
- **Ícone criado** no menu de aplicações
- **Melhor compatibilidade** com tablets Huion específicos
- **Suporte nativo** para modelos como INSPIROY H430P

### **💡 Como usar:**
```bash
# Procurar "Huion Tablet" no menu de aplicações
# Configurar área de trabalho e botões do tablet
# Para osu!: configure Raw Input: OFF nas configurações do jogo
```

### **📋 Informações Importantes:**
- **Repositórios** necessários configurados automaticamente
- **Chaves GPG** adicionadas automaticamente
- **Dependências** do sistema instaladas
- **Configurações** básicas aplicadas

## 🔗 Links Úteis
- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação:** Este README

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em sistemas baseados em Debian/Ubuntu!**
