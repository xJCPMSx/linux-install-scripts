# Scripts de Instalação Linux

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0--beta-orange.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## ⚠️ **VERSÃO BETA - TESTES**
Esta é uma versão beta para testes. Funcionalidades podem mudar antes da versão final.

## 📋 Descrição
Coleção de scripts automatizados para instalação de programas essenciais em diferentes distribuições Linux, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e jogos.

## 🐧 Distribuições Suportadas

### **openSUSE**
- ✅ **openSUSE Leap 15.3+**
- ✅ **openSUSE Tumbleweed**
- ✅ **SUSE Linux Enterprise**

### **Debian/Ubuntu**
- ✅ **Debian 11+** (Bullseye, Bookworm)
- ✅ **Ubuntu 20.04+** (LTS e não-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

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

### **🖥️ Interface Gráfica (GUI):**
```bash
# Interface gráfica interativa (detecta automaticamente zenity/kdialog)
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/gui-install.sh
chmod +x gui-install.sh
./gui-install.sh
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


### **🐳 Docker:**
```bash
# Construir imagem Docker
docker build -f docker/Dockerfile -t linux-install-scripts .

# Executar com Docker Compose
cd docker
docker-compose up -d
```

## 📁 Estrutura do Projeto
```
linux-install-scripts/
├── 🎯 auto-install.sh          # Detecção automática
├── 🗑️ uninstall.sh             # Script de desinstalação
├── 🖥️ gui-install.sh           # Interface gráfica unificada
├── 📄 LICENSE                   # Licença MIT
├── 📋 CHANGELOG.md             # Histórico de versões
├── 📖 README.md                # Documentação (português)
├── 📖 README-EN.md             # Documentação (english)
├── 🔧 config/
│   └── config.conf             # Configurações personalizáveis
├── 🐳 docker/
│   ├── Dockerfile              # Containerização
│   └── docker-compose.yml      # Orquestração
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

## 🔧 Funcionalidades

### **🎯 Funcionalidades Básicas:**
- ✅ **Detecção automática** - Identifica distribuição e executa script apropriado
- ✅ **Instalação inteligente** - Não reinstala programas existentes
- ✅ **Suporte múltiplas distribuições** - openSUSE, Debian, Ubuntu e derivados
- ✅ **Verificações robustas** - Detecta instalações de diferentes formas
- ✅ **Fallback inteligente** - Múltiplas opções de instalação

### **🖥️ Interface Gráfica:**
- ✅ **GUI interativa** - Interface amigável com Zenity
- ✅ **Seleção de programas** - Escolha quais programas instalar
- ✅ **Configurações avançadas** - Opções personalizáveis
- ✅ **Menu principal** - Navegação fácil entre funcionalidades
- ✅ **Progresso visual** - Barra de progresso durante instalação

- ✅ **Troubleshooting** - Facilita resolução de problemas

### **🐳 Containerização:**
- ✅ **Docker** - Containerização completa
- ✅ **Docker Compose** - Orquestração de serviços
- ✅ **Múltiplos ambientes** - Desenvolvimento, teste, produção
- ✅ **Portas expostas** - Para desenvolvimento web
- ✅ **Isolamento** - Ambiente controlado

### **🔄 CI/CD:**
- ✅ **GitHub Actions** - Testes automáticos
- ✅ **Build automático** - Construção de imagens
- ✅ **Deploy automático** - Deploy em produção
- ✅ **Qualidade de código** - Análise e validação
- ✅ **Segurança** - Verificação de vulnerabilidades

### **🖥️ Integração Desktop:**
- ✅ **KDE** - Integração completa com KDE
- ✅ **GNOME** - Suporte ao GNOME Shell
- ✅ **XFCE** - Compatibilidade com XFCE
- ✅ **Menu de aplicações** - Entradas no menu
- ✅ **Atalhos desktop** - Ícones na área de trabalho

### **⚙️ Configuração:**
- ✅ **Arquivo de configuração** - Personalização completa
- ✅ **Configurações por usuário** - Adaptável às necessidades
- ✅ **Níveis de log** - Controle de verbosidade
- ✅ **Opções de backup** - Configuração de backup
- ✅ **Interface** - Configurações da GUI

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- **Detecção automática** da distribuição
- **Instalação seletiva** - apenas programas não presentes
- **Fallback robusto** para diferentes versões
- **Limpeza automática** de conflitos
- **Interface amigável** com progresso visual

### **🔧 Configuração Automática:**
- **Java** configurado como alternativa padrão
- **Git** com autenticação SSH
- **Ícones personalizados** para aplicativos
- **Extensões VSCode** instaladas automaticamente
- **Configuração personalizável** via config.conf

### **💾 Backup e Segurança:**
- **Backup automático** antes da instalação
- **Logs detalhados** para troubleshooting
- **Verificação de integridade** dos programas
- **Restauração** de configurações

### **🖥️ Interface e Integração:**
- **GUI interativa** com Zenity
- **Integração desktop** (KDE, GNOME, XFCE)
- **Menu de aplicações** nativo
- **Atalhos** na área de trabalho

### **🐳 Containerização e CI/CD:**
- **Docker** para isolamento
- **Docker Compose** para orquestração
- **GitHub Actions** para CI/CD
- **Múltiplos ambientes** (dev, test, prod)

## 📝 Informações Importantes

- **Detecção automática** da distribuição Linux
- **Instalação inteligente** - não reinstala programas existentes
- **Múltiplas formas de instalação** (repositórios, Flatpak, AppImage)
- **Backup automático** antes de grandes mudanças
- **Logs detalhados** para troubleshooting
- **Integração nativa** com desktops (KDE, GNOME, XFCE)

## 💡 Exemplos de Uso

### **🖥️ Interface Gráfica:**
```bash
# Executar GUI
./gui/gui-install.sh

# Menu principal com opções:
# 1. 🚀 Instalação Automática
# 2. ⚙️ Configurações
# 3. 📋 Listar Programas
# 4. 🗑️ Desinstalar Programas
# 5. 💾 Backup/Restore
# 6. 📊 Estatísticas
# 7. ❓ Ajuda
```

### **💾 Sistema de Backup:**
```bash
# Criar backup completo
./backup/backup.sh create

# Listar backups disponíveis
./backup/backup.sh list

# Restaurar backup específico
./backup/backup.sh restore ~/.linux-install-scripts/backup/backup-20250928-103000

# Ver estatísticas
./backup/backup.sh stats
```


### **🐳 Docker:**
```bash
# Construir imagem
docker build -f docker/Dockerfile -t linux-install-scripts .

# Executar container
docker run -it linux-install-scripts

# Usar Docker Compose
cd docker
docker-compose up -d
```

### **🖥️ Integração Desktop:**
```bash
# Integrar com desktop atual
./desktop/desktop-integration.sh

# Resultado:
# - Entradas no menu de aplicações
# - Atalhos na área de trabalho
# - Integração com KDE/GNOME/XFCE
```

## 🔗 Links Úteis
- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação:** READMEs específicos em cada pasta

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em diferentes distribuições Linux!**