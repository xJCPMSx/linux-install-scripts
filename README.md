# Scripts de Instalação Linux

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-2.6-brightgreen.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição
Coleção de scripts automatizados para instalação de programas essenciais em diferentes distribuições Linux, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e jogos.

## 🐧 Distribuições Suportadas

### **openSUSE**
- **openSUSE Leap 15.3+**
- **openSUSE Tumbleweed**
- **SUSE Linux Enterprise**

### **Debian/Ubuntu**
- **Debian 11+** (Bullseye, Bookworm)
- **Ubuntu 20.04+** (LTS e não-LTS)
- **Linux Mint 20+**
- **Pop!_OS 20.04+**
- **Elementary OS 6+**
- **Zorin OS 16+**
- **Kali Linux Rolling**

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

### **📋 Instalação Manual por Distribuição:**

#### **openSUSE:**
```bash
# Baixar e executar
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/opensuse/install-programs.sh
chmod +x install-programs.sh
./install-programs.sh
```

#### **Debian/Ubuntu:**
```bash
# Baixar e executar
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/debian/install-programs-debian.sh
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

### **🗑️ Desinstalação:**
```bash
# Remover todos os programas instalados
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```

## 📁 Estrutura do Projeto
```
linux-install-scripts/
├── auto-install.sh          # 🎯 Detecção automática
├── uninstall.sh             # 🗑️  Script de desinstalação
├── LICENSE                   # 📄 Licença MIT
├── CHANGELOG.md             # 📋 Histórico de versões
├── README.md                # 📖 Documentação (português)
├── README-EN.md             # 📖 Documentation (english)
├── opensuse/
│   ├── install-programs.sh
│   ├── README.md
│   └── README-EN.md
└── debian/
    ├── install-programs-debian.sh
    ├── README.md
    └── README-EN.md
```

## 🔧 Funcionalidades

### **🎯 Detecção Automática:**
- ✅ **Detecção de distribuição** - Identifica automaticamente o sistema
- ✅ **Execução inteligente** - Executa o script apropriado
- ✅ **Suporte a múltiplas distribuições** - openSUSE, Debian, Ubuntu e derivados
- ✅ **Interface amigável** - Feedback visual durante a detecção

### **Instalação Automática:**
- ✅ Repositórios necessários
- ✅ Chaves GPG
- ✅ Dependências do sistema
- ✅ Programas principais
- ✅ Configurações básicas

### **Configurações Incluídas:**
- ✅ Java com fallback inteligente
- ✅ Git com autenticação
- ✅ Ícones para aplicativos
- ✅ Extensões do VSCode

### **📋 Documentação Completa:**
- ✅ **READMEs bilíngues** - Português e inglês
- ✅ **CHANGELOG** - Histórico detalhado de versões
- ✅ **LICENSE** - Licença MIT
- ✅ **Badges informativos** - Status e compatibilidade

### **🚀 Funcionalidades Especiais:**
- ✅ **Script de desinstalação** - Remoção completa de programas
- ✅ **Detecção automática** - Identifica distribuição e executa script apropriado

## 🔧 Configurações Automáticas
- **Java** configurado como alternativa padrão
- **Git** com configuração de autenticação
- **Ícones** para aplicativos personalizados
- **Extensões** do VSCode instaladas automaticamente

## 📊 Compatibilidade

### **openSUSE:**
- ✅ **openSUSE Leap 15.3+**
- ✅ **openSUSE Tumbleweed**
- ✅ **SUSE Linux Enterprise**

### **Debian/Ubuntu:**
- ✅ **Debian 11+** (Bullseye, Bookworm)
- ✅ **Ubuntu 20.04+** (LTS e não-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Características
- **Instalação automática** de todos os programas
- **Configuração inteligente** de dependências
- **Fallback robusto** para diferentes versões
- **Limpeza automática** de conflitos
- **Interface amigável** com progresso visual

## 📝 Notas
- Os scripts detectam automaticamente a distribuição
- Instalam apenas programas que não estão presentes
- Configuram automaticamente as alternativas do Java
- Criam ícones personalizados para aplicativos

## 🔗 Links Úteis
- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação:** READMEs específicos em cada pasta

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em diferentes distribuições Linux!**