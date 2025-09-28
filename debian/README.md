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
- **Driver Huion Tablet** - Suporte a tablets gráficos

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
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/gui/gui-install.sh
chmod +x gui/gui-install.sh
./gui/gui-install.sh
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

### **💾 Sistema de Backup:**
```bash
# Criar backup do sistema
./backup/backup.sh create

# Listar backups disponíveis
./backup/backup.sh list

# Restaurar backup
./backup/backup.sh restore /caminho/do/backup
```

### **🖥️ Integração Desktop:**
```bash
# Integrar com KDE, GNOME, XFCE
./desktop/desktop-integration.sh
```

## 📋 Pré-requisitos
- **Sistema:** Debian 11+, Ubuntu 20.04+, Linux Mint 20+, Pop!_OS 20.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável

## 🔧 Funcionalidades

### **Instalação Automática:**
- ✅ Limpeza de repositórios conflitantes
- ✅ Repositórios necessários
- ✅ Chaves GPG
- ✅ Dependências do sistema
- ✅ Programas principais
- ✅ Configurações básicas

### **Configurações Incluídas:**
- ✅ Java com fallback múltiplo (11→17→21→default)
- ✅ Git com autenticação
- ✅ Ícones para Cursor e Osu!
- ✅ Extensões do VSCode

## 🎯 Características Principais
- **VSCode via Flatpak** - Evita conflitos de repositórios
- **Java com fallback múltiplo** - 11→17→21→default
- **Spotify com fallback triplo** - Flatpak→snap→repositório
- **Limpeza automática** de conflitos de repositórios
- **Instalação robusta** com fallbacks inteligentes
- **Java** com fallback múltiplo para diferentes versões
- **Git** com configuração de autenticação
- **Ícones** para aplicativos personalizados
- **Extensões** do VSCode instaladas automaticamente

## 🔧 Resolução de Problemas
- **Conflitos de repositórios:** Limpeza automática integrada
- **Java não encontrado:** Fallback para múltiplas versões
- **Spotify falha:** Múltiplos métodos de instalação
- **VSCode conflitos:** Instalação via Flatpak

## 📝 Notas
- O script detecta automaticamente a distribuição
- Instala apenas programas que não estão presentes
- Configura automaticamente as alternativas do Java
- Cria ícones personalizados para aplicativos
- Resolve automaticamente conflitos de repositórios

## 🔗 Links Úteis
- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação:** Este README

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em sistemas baseados em Debian/Ubuntu!**
