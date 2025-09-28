# Script de Instalação Automática - openSUSE

[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Leap](https://img.shields.io/badge/Leap-15.3+-green.svg)](https://www.opensuse.org/)
[![Tumbleweed](https://img.shields.io/badge/Tumbleweed-Supported-blue.svg)](https://www.opensuse.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição
Script automatizado para instalação de programas essenciais no openSUSE, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e jogos.

## 🎯 Programas Instalados

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja
- **Linguagens:** Java (OpenJDK), Node.js
- **Controle de Versão:** Git
- **Editores:** VSCode, Cursor (AI)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal
- **Brave Browser** - Navegador privado
- **Firefox** - Navegador alternativo

### 🎵 **Multimídia**
- **Spotify** - Streaming de música
- **Osu!** - Jogo de ritmo

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
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/opensuse/install-programs.sh

# Tornar executável
chmod +x install-programs.sh

# Executar
./install-programs.sh
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

### **🖥️ Interface Gráfica:**
```bash
# Interface gráfica interativa (na raiz do projeto)
../gui-install.sh
```

### **🖥️ Integração Desktop:**
```bash
# Integrar com KDE, GNOME, XFCE
./desktop/desktop-integration.sh
```

## 📋 Pré-requisitos
- **Sistema:** openSUSE Leap 15.3+ ou Tumbleweed
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- **Detecção automática** da versão do openSUSE
- **Instalação seletiva** - apenas programas não presentes
- **Fallback robusto** para diferentes versões
- **Limpeza automática** de conflitos
- **Interface amigável** com progresso visual

### **🔧 Configuração Automática:**
- **Java** configurado como alternativa padrão
- **Git** com autenticação SSH
- **Ícones personalizados** para Cursor e Osu!
- **Extensões VSCode** instaladas automaticamente

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
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento no openSUSE!**
