# Script de Instalação Automática - Debian/Ubuntu

[![Debian](https://img.shields.io/badge/Debian-11%2B-13%2B-A80030?style=flat&logo=debian)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-26.04%2B-E95420?style=flat&logo=ubuntu)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição

Script automatizado para instalação de programas essenciais em sistemas baseados em Debian/Ubuntu, incluindo compiladores, ferramentas de desenvolvimento, ferramentas de IA, navegadores, editores de código e aplicativos.

## ✅ Distribuições Suportadas

- **Debian:** 11 (Bullseye), 12 (Bookworm), 13 (Trixie)
- **Ubuntu:** 24.04+, 26.04+
- **Linux Mint:** 20+
- **Pop!_OS:** 24.04+
- **Elementary OS:** 6+
- **Zorin OS:** 16+
- **Kali Linux:** Rolling

## 🎯 Programas Instalados

### 🤖 **Ferramentas de IA (Novas na v1.1-stable)**
- **Antigravity** - Ferramenta de IA via Python/PIP
- **Claude Code** - CLI oficial da Anthropic para engenharia de software assistida por IA
- **OpenCode** - Extensões para desenvolvimento (opcional)

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja, build-essential
- **Linguagens:** Java (OpenJDK com fallback automático), Node.js, npm, Python3, pip
- **Controle de Versão:** Git
- **Editores:** VSCode (via Flatpak), Cursor (AppImage - Editor com IA)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal (.deb oficial)
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎮 **Plataformas de Jogos & Otimização**
- **Steam** - Maior plataforma de distribuição de jogos para PC
- **Lutris** - Gerenciador de jogos (Steam, GOG, Epic, Emuladores, etc.)
- **Heroic Games Launcher** - Cliente para Epic Games Store e GOG
- **Osu!** - Jogo de ritmo (AppImage)
- **WinBoat** - Executa aplicativos Windows no Linux
- **GameMode** - Otimização de performance para jogos
- **DXVK** - Compatibilidade DirectX para Vulkan
- **Vulkan** - API gráfica moderna (retrocompatível com Debian 11/12)

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (Flatpak→Snap→Repositório com fallback)
- **yt-dlp** - Download de vídeos (sucessor do youtube-dl)

### 🛠️ **Ferramentas & Drivers**
- **AnyDesk** - Acesso remoto (.deb oficial)
- **Docker e Docker Compose** - Containerização
- **Driver Oficial da Huion** - Driver para tablets Huion (Kamvas, Inspiroy, etc.)
- **WireGuard** - VPN moderna e segura
- **FreeRDP 3** - Protocolo RDP moderno (essencial para WinBoat no Debian 13)
- **Fastfetch** - Ferramenta de informações do sistema (padrão no Debian 13, fallback para Neofetch em sistemas antigos)

### 🔒 **Segurança & OSINT (Kali Linux Tools)**
- **Nmap** - Scanner de rede
- **Wireshark** - Analisador de pacotes
- **John the Ripper** - Quebra de senhas
- **Hydra** - Brute force
- **Aircrack-ng** - Segurança WiFi
- **SQLMap** - SQL Injection
- **Nikto** - Scanner web
- **Hashcat** - Quebra de hash
- **Gobuster** - Directory/DNS bruteforce
- **ffuf** - Fuzzing web
- **SpiderFoot** - Automação OSINT
- **Sherlock** - Busca de username em redes sociais
- **theHarvester** - Coleta de emails e informações
- **GHunt** - OSINT de contas Google
- **PhoneInfoga** - OSINT de números de telefone
- **Maigret** - Busca avançada de username
- **Holehe** - Verificação de email em mais de 120 sites

## 🚀 Como Usar

### **🎯 Instalação Automática (Recomendado):**
```bash
# Clone o repositório
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts

# Detecção automática (executa script do Debian/Ubuntu)
./auto-install.sh
```

### **🖥️ Interface Gráfica:**
```bash
# Interface gráfica interativa
./gui-install.sh
```

### **📋 Instalação Manual:**
```bash
# Executar script específico do Debian/Ubuntu
cd debian
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📋 Pré-requisitos

- **Sistema:** Debian 11+, Ubuntu 24.04+, Linux Mint 20+, Pop!_OS 24.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável
- **Espaço:** ~3GB para instalação completa

## 🎯 Características Principais

### **🚀 Instalação Inteligente:**
- ✅ **Detecção automática** da distribuição Debian/Ubuntu
- ✅ **Suporte completo ao Debian 13 (Trixie)** com correções de GPG e repositórios
- ✅ **Instalação seletiva** - apenas programas não instalados
- ✅ **Fallback robusto** - múltiplas fontes (repositórios, Flatpak, Snap, AppImage, .deb)
- ✅ **Retrocompatibilidade** - mantém suporte a Debian 11, Ubuntu 24.04+
- ✅ **Limpeza automática** de conflitos de repositórios
- ✅ **Mensagens informativas** durante todo o processo

### **🔧 Configuração Automática:**
- ✅ **Repositórios** oficiais adicionados (Chrome, Docker, etc.)
- ✅ **Chaves GPG** importadas automaticamente
- ✅ **Java** com fallback múltiplo automático
- ✅ **Git** preparado para uso com SSH
- ✅ **Docker** com usuário adicionado ao grupo
- ✅ **Extensões VSCode** instaladas automaticamente
- ✅ **Otimização automática** para jogos (GameMode, DXVK, Vulkan)
- ✅ **Habilitar TRIM** automaticamente para SSDs
- ✅ **Desabilitar serviços desnecessários** (bluetooth, cups, avahi-daemon)

## 🗂️ Estrutura do Projeto

```
.
├── auto-install.sh           # Detecção automática de distribuição
├── CHANGELOG.md              # Histórico de versões
├── config/
│   └── config.conf           # Configurações personalizáveis
├── debian/
│   ├── huion/                # Driver oficial da Huion
│   ├── install-programs-debian.sh
│   ├── README-EN.md
│   └── README.md
├── docker/
│   ├── docker-compose.yml
│   └── Dockerfile
├── gui-install.sh            # Interface gráfica
├── LICENSE
├── opensuse/
│   ├── huion/
│   ├── install-programs-opensuse.sh
│   ├── README-EN.md
│   └── README.md
├── README-EN.md
├── README.md
└── uninstall.sh              # Script de desinstalação
```

## 🐳 Docker e Docker Compose

### **🔧 Instalação Automática:**
- **Docker CE** instalado via repositório oficial
- **Docker Compose** disponível como plugin (`docker compose`)
- **Usuário adicionado ao grupo docker** (uso sem sudo após reboot)
- **Serviço habilitado e iniciado** automaticamente

### **💡 Como usar:**
```bash
# Verificar instalação
docker --version
docker compose version

# Executar container de teste
docker run hello-world
```

**⚠️ Importante:** Faça logout/login (ou reboot) após a instalação para usar Docker sem sudo.

## 🎮 Driver Oficial da Huion

### **🔧 Instalação Automática:**
- **Driver oficial** incluído no repositório (`debian/huion/`)
- **Instalação integrada** no script
- **Ícone criado** no menu de aplicações
- **Regras udev** configuradas automaticamente
- **Melhor compatibilidade** com tablets Huion

### **💡 Modelos Suportados:**
- INSPIROY H430P, H640P, H950P, H1060P
- KAMVAS GT-191, GT-221, Pro 16, Pro 22, Pro 24
- E muitos outros modelos Huion

### **📝 Como usar:**
```bash
# Após instalação, procure "Huion Tablet" no menu de aplicações
# Configure área de trabalho, botões e sensibilidade
# Para osu!: configure Raw Input: OFF nas configurações do jogo
```

**⚠️ Importante:** Reinicie o sistema após a instalação do driver para funcionamento correto.

## 📺 yt-dlp - Download de Vídeos

### **🔧 Instalação:**
- **Sucessor do youtube-dl** mais atualizado e mantido
- **Suporte a múltiplas plataformas** (YouTube, Vimeo, Twitch, SoundCloud, etc.)
- **Instalação via pip** (sempre a versão mais recente)

### **💡 Uso Básico:**
```bash
# Download de vídeo
yt-dlp "https://www.youtube.com/watch?v=VIDEO_ID"

# Download apenas do áudio (MP3)
yt-dlp -x --audio-format mp3 "URL_DO_VIDEO"

# Download em qualidade específica
yt-dlp -f "best[height<=720]" "URL_DO_VIDEO"

# Download de playlist completa
yt-dlp "URL_DA_PLAYLIST"
```

## 🔒 WireGuard - VPN Moderna

### **🔧 Instalação Automática:**
- **VPN moderna, rápida e segura**
- **Configuração simplificada** comparado a OpenVPN
- **Instalado automaticamente** via apt (wireguard wireguard-tools)
- **Arquivos de configuração** em `/etc/wireguard/`

### **💡 Uso Básico:**
```bash
# Gerar chaves
sudo wg genkey | tee privatekey | wg pubkey > publickey

# Criar configuração
sudo nano /etc/wireguard/wg0.conf

# Iniciar/Parar VPN
sudo wg-quick up wg0
sudo wg-quick down wg0

# Habilitar no boot
sudo systemctl enable wg-quick@wg0

# Ver status
sudo wg show
```

## 🔐 Ferramentas de Segurança - Guia Completo

### **🛡️ Nmap - Scanner de Rede**

O Nmap é a ferramenta padrão para reconhecimento de rede e scanning de portas.

```bash
# Scan básico de portas
nmap 192.168.1.1

# Scan de portas específicas
nmap -p 22,80,443 192.168.1.1

# Scan completo com detecção de serviços e versões
nmap -sV -sC -p- 192.168.1.1

# Scan de rede inteira
nmap -sP 192.168.1.0/24

# Scan stealthy (SYN)
nmap -sS 192.168.1.1

# Scan UDP
nmap -sU 192.168.1.1

# Detectar sistema operacional
nmap -O 192.168.1.1

# Output para arquivo
nmap -oN scan.txt 192.168.1.1
```

### **📡 Wireshark - Analisador de Pacotes**

Capture e analise tráfego de rede em tempo real.

```bash
# Iniciar Wireshark (modo gráfico)
sudo wireshark

# Captura de interface específica
sudo wireshark -i eth0

# Captura com filtro específico
sudo wireshark -i eth0 -f "port 80"

# Salvar captura para arquivo
sudo wireshark -i eth0 -w captura.pcap

# Análise via CLI (tshark)
sudo tshark -i eth0 -c 100
```

### **🔓 Hydra - Brute Force**

Ferramenta de força bruta para testes de autenticação.

```bash
# Brute force em SSH
hydra -l usuario -P wordlist.txt ssh://192.168.1.1

# Brute force em HTTP POST
hydra -l admin -P wordlist.txt 192.168.1.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=incorrect"

# Brute force em FTP
hydra -l ftp -P wordlist.txt ftp://192.168.1.1

# Brute force em MySQL
hydla -l root -P wordlist.txt 192.168.1.1 mysql

# Usar arquivo de usuários
hydra -L usuarios.txt -P wordlist.txt ssh://192.168.1.1
```

### **💉 SQLMap - SQL Injection**

Automatiza a detecção e exploração de vulnerabilidades SQL Injection.

```bash
# Testar URL para SQLi
sqlmap -u "http://alvo.com/pagina.php?id=1"

# Enumeração de databases
sqlmap -u "http://alvo.com/pagina.php?id=1" --dbs

# Listar tabelas de uma database
sqlmap -u "http://alvo.com/pagina.php?id=1" -D nome_db --tables

# Extrair dados de uma tabela
sqlmap -u "http://alvo.com/pagina.php?id=1" -D nome_db -T usuarios --dump

# Obter shell interativo
sqlmap -u "http://alvo.com/pagina.php?id=1" --os-shell

# Usar Tor para anonimato
sqlmap -u "http://alvo.com/pagina.php?id=1" --tor --tor-type=SOCKS5
```

## 🔍 Ferramentas de OSINT - Guia Completo

### **📂 Localização das Ferramentas**

As ferramentas OSINT são instaladas em `~/osint-tools/` e disponíveis via PATH:

```
~/osint-tools/
├── sherlock/          # Sherlock
├── theHarvester/     # theHarvester
├── maigret/           # Maigret
├── holehe/            # Holehe
├── GHunt/             # GHunt
├── phoneinfoga/       # PhoneInfoga
└── spiderfoot/        # SpiderFoot
```

**Ferramentas disponíveis globalmente:**
- Sherlock, Maigret, Holehe: `python3 ~/osint-tools/ferramenta.py`
- theHarvester: `theHarvester` (global via pip)
- SpiderFoot: `sf` (global via pip)

### **🔎 Sherlock - Busca de Username**

Encontre contas em redes sociais por username.

```bash
# Busca básica
python3 ~/osint-tools/sherlock/sherlock.py usuario

# Busca com saída em JSON
python3 ~/osint-tools/sherlock/sherlock.py usuario --json

# Busca com threading paralelo
python3 ~/osint-tools/sherlock/sherlock.py usuario --timeout 1

# Buscar em todas as redes
python3 ~/osint-tools/sherlock/sherlock.py usuario --output resultados.txt
```

### **🌐 theHarvester - Coleta de Emails**

Colete emails, subdomínios e IPs de fontes públicas.

```bash
# Coleta básica de emails
theHarvester -d exemplo.com -b google

# Múltiplas fontes
theHarvester -d exemplo.com -b google,bing,linkedin

# Coleta de subdomínios
theHarvester -d exemplo.com -b shodan -n

# Salvar resultados
theHarvester -d exemplo.com -b all -f resultados.html

# Limite de resultados
theHarvester -d exemplo.com -b google -l 100
```

### **🎯 Maigret - Busca Avançada de Username**

Versão avançada do Sherlock com mais plataformas.

```bash
# Busca básica
python3 ~/osint-tools/maigret/maigret.py usuario

# Busca detalhada com screenshots
python3 ~/osint-tools/maigret/maigret.py usuario -v

# Busca sem progresso bar
python3 ~/osint-tools/maigret/maigret.py usuario --no-progress

# Salvar em JSON
python3 ~/osint-tools/maigret/maigret.py usuario --json -o resultados.json

# Usar proxy
python3 ~/osint-tools/maigret/maigret.py usuario --proxy socks5://127.0.0.1:9050
```

### **📧 Holehe - Verificação de Email**

Verifique se um email existe em mais de 120 serviços.

```bash
# Verificação básica
python3 ~/osint-tools/holehe/holehe.py email@exemplo.com

# Saída em JSON
python3 ~/osint-tools/holehe/holehe.py email@exemplo.com --json

# Apenas serviços que encontraram
python3 ~/osint-tools/holehe/holehe.py email@exemplo.com --found

# Timeout personalizado
python3 ~/osint-tools/holehe/holehe.py email@exemplo.com --timeout 5
```

### **📱 GHunt - OSINT de Contas Google**

Extraia informações de contas Google pelo email ou ID.

```bash
# Informações por email
python3 ~/osint-tools/GHunt/ghunt.py email@exemplo.com

# Informações por ID do Google
python3 ~/osint-tools/GHunt/ghunt.py 1182...ID

# MODO interativo
python3 ~/osint-tools/GHunt/ghunt.py

# Check de cookies (necessário para algumas funções)
python3 ~/osint-tools/GHunt/ghunt.py --check
```

### **📞 PhoneInfoga - OSINT de Telefone**

Colete informações sobre números de telefone.

```bash
# Scan básico
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999

# Scan com reconhecimento completo
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 -i

# Apenas informações falsas (VoIP)
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 --use-numverify

# Formato específico
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n "+55 11 99999-9999" -f dados.json
```

### **🕷️ SpiderFoot - Automação OSINT**

Interface web para OSINT automatizado.

```bash
# Iniciar interface web (porta 5001)
sf -s 192.168.1.1

# Módulo CLI
sfcli -s 192.168.1.1 -m sfp_spider

# Scan rápido
sfcli -s example.com -M sfp_arin -M sfp_dnsresolv -M sfp_email

# Exportar resultados
sfcli -s example.com -f json > resultados.json
```

**Acesse:** http://localhost:5001 para interface gráfica

---

## ⚙️ Configuração Personalizada

Edite o arquivo `../config/config.conf` para personalizar a instalação:

```ini
[INSTALLATION]
INSTALL_ANYDESK=true
INSTALL_SPOTIFY=true
INSTALL_VSCODE=true
INSTALL_CURSOR=true
INSTALL_CHROME=true
INSTALL_BRAVE=true
INSTALL_FIREFOX=true
INSTALL_JAVA=true
INSTALL_NODEJS=true
INSTALL_OSU=true
INSTALL_STEAM=true
INSTALL_DOCKER=true
INSTALL_HUION_DRIVER=true
INSTALL_YTDLP=true
INSTALL_ANTIGRAVITY=true
INSTALL_CLAUDE_CODE=true
```

Depois execute:
```bash
./install-programs-debian.sh
```

## 🗑️ Desinstalação

Para remover todos os programas instalados:

```bash
# Na raiz do projeto
cd ..
./uninstall.sh
```

## 📝 Notas Importantes

- ✅ **Instalação inteligente** - Detecta programas já instalados
- ✅ **Múltiplas tentativas** - Tenta diferentes métodos de instalação
- ✅ **Retrocompatibilidade** - Suporte a Debian 11, Ubuntu 24.04+
- ✅ **Suporte Debian 13 (Trixie)** - Correções completas de repositórios e GPG
- ✅ **Fastfetch** como padrão (Neofetch fallback em sistemas antigos)
- ✅ **FreeRDP 3** - Compatibilidade com Debian 13
- ⚠️ **Reboot recomendado** após instalação do Docker e Driver Huion
- ⚠️ **VSCode:** Instalado via Flatpak para evitar conflitos
- ⚠️ **Spotify:** Fallback triplo (Flatpak→Snap→Repositório)
- ⚠️ **Java:** Fallback múltiplo automático

## 🔗 Links Úteis

- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](../LICENSE) para mais detalhes.

---

**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em sistemas baseados em Debian/Ubuntu!**