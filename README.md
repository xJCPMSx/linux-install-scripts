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
Coleção de scripts automatizados para instalação de programas essenciais em diferentes distribuições Linux, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e aplicativos.

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
- **Driver Oficial da Huion** - Driver para tablets Huion
- **WireGuard** - VPN moderna e segura
- **yt-dlp** - Download de vídeos

## 🚀 Como Usar

### **🎯 Instalação Automática (Recomendado):**
```bash
# Clone o repositório
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts

# Detecção automática da distribuição
chmod +x auto-install.sh
./auto-install.sh
```

### **🖥️ Interface Gráfica (GUI):**
```bash
# Interface gráfica interativa
chmod +x gui-install.sh
./gui-install.sh
```

### **📋 Instalação Manual por Distribuição:**

#### **openSUSE:**
```bash
cd opensuse
chmod +x install-programs-opensuse.sh
./install-programs-opensuse.sh
```

#### **Debian/Ubuntu:**
```bash
cd debian
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

### **🗑️ Desinstalação:**
```bash
chmod +x uninstall.sh
./uninstall.sh
```

## 📁 Estrutura do Projeto
```
linux-install-scripts/
├── 🎯 auto-install.sh          # Detecção automática
├── 🖥️ gui-install.sh           # Interface gráfica
├── 🗑️ uninstall.sh             # Desinstalação
├── 📄 LICENSE                   # Licença MIT
├── 📋 CHANGELOG.md             # Histórico de versões
├── 📖 README.md                # Documentação principal
├── 🔧 config/
│   └── config.conf             # Configurações
├── 🐳 docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── opensuse/
│   ├── install-programs-opensuse.sh
│   ├── huion/                  # Driver Huion
│   └── README.md
└── debian/
    ├── install-programs-debian.sh
    ├── huion/                  # Driver Huion
    └── README.md
```

## 🔧 Funcionalidades Principais

### **✨ Instalação Inteligente:**
- ✅ **Detecção automática** da distribuição Linux
- ✅ **Instalação seletiva** - não reinstala programas existentes
- ✅ **Múltiplas fontes** - repositórios oficiais, Flatpak, Snap, AppImage
- ✅ **Fallback inteligente** - tenta múltiplas opções de instalação
- ✅ **Verificações robustas** - detecta instalações de diferentes formas

### **⚙️ Configuração Automática:**
- ✅ **Java** configurado como alternativa padrão
- ✅ **Git** preparado para uso
- ✅ **Docker** com usuário adicionado ao grupo
- ✅ **Ícones** criados automaticamente para AppImages
- ✅ **Extensões VSCode** instaladas automaticamente

### **🎨 Interface Gráfica:**
- ✅ **GUI amigável** com Zenity/Kdialog
- ✅ **Seleção personalizada** de programas
- ✅ **Progresso visual** durante instalação
- ✅ **Menu intuitivo** com todas as opções

### **🐳 Containerização:**
- ✅ **Docker** - Containerização completa
- ✅ **Docker Compose** - Orquestração de serviços
- ✅ **Ambientes isolados** para desenvolvimento

## 📦 Sistemas de Pacotes

### **Gerenciadores Instalados:**

#### **📱 Flatpak:**
- **Instalação automática** em todas as distribuições
- **Repositório Flathub** configurado
- **Aplicações sandboxed** com isolamento de segurança

#### **📦 Snap:**
- **Instalação automática** quando necessário
- **Aplicações containerizadas**
- **Atualizações automáticas**

### **🎯 Benefícios:**
- ✅ Compatibilidade universal entre distribuições
- ✅ Segurança aprimorada com isolamento
- ✅ Atualizações automáticas
- ✅ Gerenciamento simplificado

## 🎮 Driver Oficial da Huion

### **🔧 Instalação Automática:**
- **Driver oficial** incluído no repositório
- **Instalação integrada** nos scripts
- **Ícone criado** no menu de aplicações
- **Melhor compatibilidade** com tablets Huion

### **💡 Modelos Suportados:**
- INSPIROY H430P, H640P, H950P
- KAMVAS GT-191, GT-221
- E muitos outros modelos Huion

### **📝 Uso:**
```bash
# Após instalação, procure "Huion Tablet" no menu
# Configure área de trabalho e botões
# Para osu!: configure Raw Input: OFF no jogo
```

## 🐳 Docker e Docker Compose

### **🔧 Instalação:**
- **Docker CE** via repositório oficial
- **Docker Compose V2** como plugin
- **Usuário adicionado** ao grupo docker (uso sem sudo)

### **💡 Uso Básico:**
```bash
# Verificar instalação
docker --version
docker compose version

# Executar container
docker run hello-world

# Docker Compose
docker compose up -d
```

## 📺 yt-dlp - Download de Vídeos

### **🔧 Instalação:**
- **Sucessor do youtube-dl** mais atualizado
- **Suporte a múltiplas plataformas** (YouTube, Vimeo, Twitch, etc.)

### **💡 Uso Básico:**
```bash
# Download de vídeo
yt-dlp "URL_DO_VIDEO"

# Download apenas do áudio (MP3)
yt-dlp -x --audio-format mp3 "URL_DO_VIDEO"

# Download de playlist
yt-dlp "URL_DA_PLAYLIST"
```

## 🔒 WireGuard - VPN Moderna

### **🔧 Instalação Automática:**
- **VPN moderna, rápida e segura**
- **Configuração simplificada** comparado a OpenVPN
- **Instalação automática** em ambos os scripts
- **Arquivos de configuração** em `/etc/wireguard/`

### **💡 Uso Básico:**
```bash
# Gerar chaves (executar como root)
sudo -i
cd /etc/wireguard/
wg genkey | tee privatekey | wg pubkey > publickey

# Criar arquivo de configuração
sudo nano /etc/wireguard/wg0.conf

# Exemplo de configuração:
[Interface]
PrivateKey = <sua_chave_privada>
Address = 10.0.0.2/24
DNS = 1.1.1.1

[Peer]
PublicKey = <chave_publica_do_servidor>
Endpoint = vpn.exemplo.com:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25

# Iniciar VPN
sudo wg-quick up wg0

# Parar VPN
sudo wg-quick down wg0

# Habilitar no boot
sudo systemctl enable wg-quick@wg0

# Ver status
sudo wg show
```

## ⚙️ Configuração Personalizada

Edite o arquivo `config/config.conf` para personalizar a instalação:

```ini
[INSTALLATION]
INSTALL_ANYDESK=true
INSTALL_SPOTIFY=true
INSTALL_VSCODE=true
INSTALL_CURSOR=false
INSTALL_CHROME=true
INSTALL_BRAVE=false
INSTALL_FIREFOX=false
INSTALL_JAVA=true
INSTALL_NODEJS=true
INSTALL_OSU=true
INSTALL_DOCKER=true
INSTALL_HUION_DRIVER=true
INSTALL_YTDLP=true
```

Depois execute:
```bash
./auto-install.sh
```

## 📋 Requisitos

- **Sistema:** Distribuição Linux suportada
- **Permissões:** Acesso sudo/root
- **Espaço:** ~2GB para instalação completa
- **Internet:** Conexão estável para downloads

## 💡 Exemplos de Uso

### **Instalação Completa:**
```bash
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts
./auto-install.sh
```

### **Instalação com GUI:**
```bash
./gui-install.sh
# Selecione os programas desejados no menu gráfico
```

### **Instalação Personalizada:**
```bash
# 1. Editar configurações
nano config/config.conf

# 2. Executar instalação
./auto-install.sh
```

## 📝 Notas Importantes

- ⚠️ **Versão Beta:** Funcionalidades podem mudar
- ✅ **Detecção automática:** Identifica sua distribuição
- ✅ **Instalação inteligente:** Não reinstala programas existentes
- ✅ **Backup:** Logs detalhados para troubleshooting
- ⚠️ **Reboot recomendado:** Após instalação do Docker e Driver Huion

## 🔗 Links Úteis

- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Documentação por Distribuição:**
  - [openSUSE](opensuse/README.md)
  - [Debian/Ubuntu](debian/README.md)

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em diferentes distribuições Linux!**
