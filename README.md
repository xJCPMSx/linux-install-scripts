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
- **Docker e Docker Compose** - Containerização
- **OpenTabletDriver** - Driver de tablet open source (recomendado para osu!)
- **Driver Huion Tablet** - Suporte a tablets gráficos (compatibilidade)

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

### **⚙️ Configuração:**
- ✅ **Arquivo de configuração** - Personalização completa
- ✅ **Seleção de programas** - Escolha quais programas instalar
- ✅ **Configurações por usuário** - Adaptável às necessidades
- ✅ **Níveis de log** - Controle de verbosidade
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

### **⚙️ Controle de Instalação:**
- **Arquivo `config/config.conf`** - Controle total sobre a instalação
- **Seleção de programas** - Escolha exatamente o que instalar
- **Configurações de repositórios** - Controle sobre fontes de software
- **Configurações de backup** - Personalize o sistema de backup
- **Configurações de log** - Controle a verbosidade e rotação

### **💾 Backup e Segurança:**
- **Backup automático** antes da instalação
- **Logs detalhados** para troubleshooting
- **Verificação de integridade** dos programas
- **Restauração** de configurações

### **🖥️ Interface e Integração:**
- **GUI interativa** com Zenity
- **Menu de aplicações** nativo
- **Atalhos** na área de trabalho

### **🐳 Containerização e CI/CD:**
- **Docker** para isolamento
- **Docker Compose** para orquestração
- **GitHub Actions** para CI/CD
- **Múltiplos ambientes** (dev, test, prod)

## 📦 Sistemas de Pacotes Universais

### **🔧 Gerenciadores Instalados Automaticamente:**

#### **📱 Flatpak:**
- **Instalação automática** em ambos os scripts
- **Repositório Flathub** configurado automaticamente
- **Aplicações sandboxed** com isolamento de segurança
- **Atualizações automáticas** e gerenciamento simplificado

#### **📦 Snap:**
- **Instalação automática** em ambos os scripts
- **Sistema universal** da Canonical
- **Aplicações containerizadas** com dependências isoladas
- **Rollback automático** em caso de problemas
- **Repositório Snappy** configurado automaticamente no openSUSE

#### **🎯 Benefícios:**
- **Compatibilidade universal** - Funciona em qualquer distribuição
- **Segurança aprimorada** - Isolamento de aplicações
- **Atualizações automáticas** - Sem intervenção manual
- **Gerenciamento centralizado** - Um comando para tudo

## 🐳 Docker e Docker Compose - Containerização

### **🔧 O que é o Docker:**
- **Plataforma de containerização** para desenvolvimento e deploy
- **Isolamento de aplicações** com dependências incluídas
- **Docker Compose** para orquestração de múltiplos containers
- **Instalação automática** em ambos os scripts
- **Usuário adicionado ao grupo docker** para uso sem sudo

### **💡 Como usar o Docker:**
```bash
# Verificar instalação
docker --version
docker compose version

# Executar container simples
docker run hello-world

# Usar Docker Compose
docker compose up -d
```

## 🎮 OpenTabletDriver - Driver de Tablet

### **🔧 O que é o OpenTabletDriver:**
- **Driver open source** para tablets gráficos
- **Melhor compatibilidade** com jogos como osu!
- **Substituto recomendado** para drivers proprietários
- **Instalação automática** em ambos os scripts
- **Interface gráfica** para configuração

### **💡 Como usar o OpenTabletDriver:**
```bash
# Executar OpenTabletDriver
$HOME/Applications/OpenTabletDriver/OpenTabletDriver.AppImage

# Ou procurar no menu de aplicações
# Configurar área de trabalho e botões do tablet
```

## 📺 yt-dlp - Download de Vídeos

### **🔧 O que é o yt-dlp:**
- **Ferramenta de linha de comando** para download de vídeos (sucessor do youtube-dl)
- **Suporte a múltiplas plataformas** (YouTube, Vimeo, Twitch, etc.)
- **Instalação automática** em ambos os scripts
- **Download de áudio e vídeo** em diferentes qualidades
- **Mais atualizado e mantido** que o youtube-dl original

### **💡 Como usar o yt-dlp:**

#### **📥 Comandos Básicos:**
```bash
# Download de vídeo simples
yt-dlp "https://www.youtube.com/watch?v=VIDEO_ID"

# Download apenas do áudio (MP3)
yt-dlp -x --audio-format mp3 "URL_DO_VIDEO"

# Download em qualidade específica
yt-dlp -f best "URL_DO_VIDEO"

# Download de playlist completa
yt-dlp "URL_DA_PLAYLIST"
```

#### **🎯 Exemplos Práticos:**
```bash
# Download de música do YouTube
yt-dlp -x --audio-format mp3 "https://www.youtube.com/watch?v=dQw4w9WgXcQ"

# Download de vídeo em HD
yt-dlp -f "best[height<=720]" "URL_DO_VIDEO"

# Download de vídeo com legenda
yt-dlp --write-sub --sub-lang pt "URL_DO_VIDEO"
```

#### **⚙️ Opções Avançadas:**
- **`-x`** - Extrair apenas áudio
- **`--audio-format mp3`** - Formato de áudio
- **`-f best`** - Melhor qualidade disponível
- **`--write-sub`** - Baixar legendas
- **`--sub-lang pt`** - Idioma das legendas

## 🔧 Dependências e Requisitos

### **📋 Requisitos do Sistema:**
- **Distribuições suportadas:** openSUSE, Debian, Ubuntu
- **Privilégios:** Acesso sudo/root necessário
- **Espaço em disco:** ~2GB para instalação completa
- **Conexão com internet** para download de pacotes

### **🛠️ Dependências Instaladas Automaticamente:**

#### **📦 Gerenciadores de Pacotes:**
- **Flatpak** - Sistema de pacotes universais
- **Snap** - Sistema de pacotes da Canonical
- **Repositórios oficiais** - Configurados automaticamente

#### **🔧 Ferramentas de Desenvolvimento:**
- **Git** - Controle de versão
- **Curl/Wget** - Download de arquivos
- **Build-essential** - Compiladores e ferramentas
- **Node.js** - Runtime JavaScript
- **Java OpenJDK** - Runtime Java

#### **📱 Aplicações Principais:**
- **Navegadores:** Chrome, Brave, Firefox
- **Editores:** VSCode, Cursor
- **Multimídia:** Spotify
- **Produtividade:** AnyDesk
- **Jogos:** Osu!
- **Containerização:** Docker, Docker Compose
- **Tablets:** OpenTabletDriver
- **Utilitários:** yt-dlp

## 📝 Informações Importantes

- **Detecção automática** da distribuição Linux
- **Instalação inteligente** - não reinstala programas existentes
- **Múltiplas formas de instalação** (repositórios, Flatpak, Snap, AppImage)
- **Backup automático** antes de grandes mudanças
- **Logs detalhados** para troubleshooting

## 💡 Exemplos de Uso

### **⚙️ Configuração Personalizada:**
```bash
# 1. Editar arquivo de configuração
nano config/config.conf

# 2. Personalizar programas a instalar
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

# 3. Executar instalação personalizada
./auto-install.sh
```

### **🖥️ Interface Gráfica:**
```bash
# Executar GUI
./gui-install.sh

# Menu principal com opções:
# 1. 🚀 Instalação Automática
# 2. ⚙️ Configurações
# 3. 📋 Listar Programas
# 4. 🗑️ Desinstalar Programas
# 5. 💾 Backup/Restore
# 6. 📊 Estatísticas
# 7. ❓ Ajuda
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


## 🔗 Links Úteis
- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação:** READMEs específicos em cada pasta

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em diferentes distribuições Linux!**