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
# Interface gráfica interativa
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/gui/gui-install.sh
chmod +x gui/gui-install.sh
./gui/gui-install.sh
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

### **💾 Sistema de Backup:**
```bash
# Criar backup do sistema
./backup/backup.sh create

# Listar backups disponíveis
./backup/backup.sh list

# Restaurar backup
./backup/backup.sh restore /caminho/do/backup

# Ver estatísticas
./backup/backup.sh stats
```

### **🖥️ Integração com Desktop:**
```bash
# Integrar com KDE, GNOME, XFCE
./desktop/desktop-integration.sh
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
├── 📄 LICENSE                   # Licença MIT
├── 📋 CHANGELOG.md             # Histórico de versões
├── 📖 README.md                # Documentação (português)
├── 📖 README-EN.md             # Documentação (english)
├── 🔧 config/
│   └── config.conf             # Configurações personalizáveis
├── 🖥️ gui/
│   └── gui-install.sh          # Interface gráfica
├── 💾 backup/
│   └── backup.sh               # Sistema de backup
├── 📝 logs/
│   └── logger.sh               # Sistema de logs
├── 🐳 docker/
│   ├── Dockerfile              # Containerização
│   └── docker-compose.yml      # Orquestração
├── 🔄 .github/workflows/
│   └── ci.yml                  # CI/CD
├── 🖥️ desktop/
│   └── desktop-integration.sh  # Integração desktop
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

### **💾 Sistema de Backup:**
- ✅ **Backup automático** - Cria backup antes da instalação
- ✅ **Restauração** - Restaura configurações do backup
- ✅ **Limpeza automática** - Remove backups antigos
- ✅ **Estatísticas** - Mostra informações dos backups
- ✅ **Configurações** - Backup de repositórios e configurações

### **📝 Sistema de Logs:**
- ✅ **Logs detalhados** - Registra todas as operações
- ✅ **Níveis de log** - INFO, SUCCESS, WARNING, ERROR
- ✅ **Rotação automática** - Gerencia tamanho dos logs
- ✅ **Estatísticas** - Resumo de execuções
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

### **🚀 Instalação:**
- **Instalação automática** de todos os programas
- **Configuração inteligente** de dependências
- **Fallback robusto** para diferentes versões
- **Limpeza automática** de conflitos
- **Interface amigável** com progresso visual

### **🔧 Configuração:**
- **Java** configurado como alternativa padrão
- **Git** com configuração de autenticação
- **Ícones** para aplicativos personalizados
- **Extensões** do VSCode instaladas automaticamente
- **Configuração personalizável** via arquivo config.conf

### **💾 Backup e Segurança:**
- **Backup automático** antes da instalação
- **Restauração** de configurações
- **Logs detalhados** para troubleshooting
- **Verificação de integridade** dos programas

### **🖥️ Interface:**
- **GUI interativa** com Zenity
- **Integração desktop** (KDE, GNOME, XFCE)
- **Menu de aplicações** nativo
- **Atalhos** na área de trabalho

### **🐳 Containerização:**
- **Docker** para isolamento
- **Docker Compose** para orquestração
- **Múltiplos ambientes** (dev, test, prod)
- **CI/CD** com GitHub Actions

## 📝 Notas

### **🔍 Detecção Inteligente:**
- Os scripts detectam automaticamente a distribuição
- Instalam apenas programas que não estão presentes
- Verificam múltiplas formas de instalação (repositórios, Flatpak, AppImage)

### **⚙️ Configuração Automática:**
- Configuram automaticamente as alternativas do Java
- Criam ícones personalizados para aplicativos
- Configuram Git com autenticação SSH
- Instalam extensões úteis do VSCode

### **🛡️ Segurança e Backup:**
- Criam backup automático antes da instalação
- Registram logs detalhados de todas as operações
- Verificam integridade dos programas instalados
- Limpam automaticamente conflitos de repositórios

### **🖥️ Integração:**
- Integram com desktops (KDE, GNOME, XFCE)
- Criam entradas no menu de aplicações
- Adicionam atalhos na área de trabalho
- Suportam interface gráfica interativa

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

### **📝 Sistema de Logs:**
```bash
# Usar logger em scripts
source logs/logger.sh

# Inicializar sistema de logs
init_logger

# Log de informações
log_info "Iniciando instalação..."

# Log de sucesso
log_success "Programa instalado com sucesso"

# Log de erro
log_error "Falha na instalação"

# Finalizar logs
finish_logger $?
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