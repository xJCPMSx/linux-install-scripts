# Scripts de Instalação Linux

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-Supported-red.svg)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-orange.svg)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1.0-blue.svg)](https://github.com/xJCPMSx/linux-install-scripts)

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

### 🎮 **Plataformas de Jogos**
- **Steam** - Maior plataforma de distribuição de jogos para PC
- **Lutris** - Gerenciador de jogos (Steam, GOG, Epic, Emuladores, etc.)
- **Heroic Games Launcher** - Cliente para Epic Games Store e GOG
- **WinBoat** - Executa aplicativos Windows no Linux nativamente
- **Osu!** - Jogo de ritmo

### 🎵 **Multimídia**
- **Spotify** - Streaming de música
- **yt-dlp** - Download de vídeos

### 🕵️ **OSINT (Open Source Intelligence)**
- **SpiderFoot** - Automação de OSINT
- **Sherlock** - Busca de usernames em redes sociais
- **theHarvester** - Coleta de informações de emails
- **Recon-ng** - Framework de reconhecimento web
- **GHunt** - OSINT de contas Google
- **PhoneInfoga** - OSINT de números de telefone
- **Holehe** - OSINT de emails

### 🔐 **Segurança e Pentesting**
- **Nmap** - Scanner de rede
- **Wireshark** - Análise de pacotes
- **John the Ripper** - Quebra de senhas
- **Hydra** - Brute force de senhas
- **Aircrack-ng** - Segurança WiFi
- **SQLMap** - SQL Injection
- **Nikto** - Scanner web
- **Hashcat** - Quebra de hash
- **Gobuster** - Directory/DNS bruteforce
- **ffuf** - Fuzzing web

### 🎮 **Otimizações para Jogos**
- **Drivers Mesa** otimizados
- **GameMode** - Otimização de recursos
- **Configurações DXVK** para DirectX no Linux
- **Otimizações de memória** para jogos
- **Steam/Lutris/Heroic** configurados
- **Desativar compositor** durante jogos

### 🎉 **Ferramentas Divertidas**
- **fortune** - Gerador de frases aleatórias
- **cowsay** - Vaca que fala (ASCII art)
- **cmatrix** - Efeito Matrix no terminal
- **nyancat** - Gato arco-íris animado

#### **💡 Dicas de Uso:**
```bash
# Frases aleatórias com vaca
fortune | cowsay

# Efeito Matrix
cmatrix

# Gato arco-íris animado
nyancat

# Combinando ferramentas
fortune | cowsay -f dragon

# Se cowsay travar o terminal, tente:
cowsay "mensagem curta"
# ou use timeout:
timeout 5 cowsay "mensagem"
```

### 🛠️ **Ferramentas**
- **AnyDesk** - Acesso remoto
- **Docker e Docker Compose** - Containerização
- **Driver Oficial da Huion** - Driver para tablets Huion
- **WireGuard** - VPN moderna e segura

### 🔒 **Ferramentas de Segurança (Kali Linux)**
- **Nmap** - Scanner de rede avançado
- **Wireshark** - Análise de pacotes de rede
- **John the Ripper** - Quebra de senhas
- **Hydra** - Brute force de autenticação
- **Aircrack-ng** - Auditoria de segurança WiFi
- **SQLMap** - Detecção e exploração de SQL injection
- **Nikto** - Scanner de vulnerabilidades web
- **Hashcat** - Quebra de hash acelerada por GPU
- **Gobuster** - Enumeração de diretórios e DNS
- **ffuf** - Fuzzing web rápido

### 🔍 **Ferramentas de OSINT**
- **Sherlock** - Busca de username em 400+ redes sociais
- **theHarvester** - Coleta de emails, subdomínios e informações
- **Recon-ng** - Framework completo de reconhecimento
- **SpiderFoot** - Automação de OSINT
- **GHunt** - OSINT de contas Google
- **PhoneInfoga** - OSINT de números de telefone
- **Maigret** - Busca avançada de username com mais de 2500 sites
- **Holehe** - Verificação de email em mais de 120 sites

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
- ✅ **Verificações aprimoradas** - detecta apps via comando, dpkg, flatpak, snap
- ✅ **Nova ferramenta OSINT** - Holehe para verificação de emails
- ✅ **Otimização de Gráficos Intel** - Detecção automática e configuração de parâmetros de kernel (`i915.enable_psr=0`) e drivers para evitar congelamentos.
- ✅ **Configuração personalizável** - arquivo `config/config.conf` para controlar instalações

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

### **🔧 Correções Automáticas:**
- ✅ **KDE** - Correções automáticas para problemas de tema
- ✅ **Flatpak** - Otimização de permissões para KDE
- ✅ **Qt** - Configuração de variáveis de ambiente
- ✅ **Alias** - Criação automática de comandos (ex: `spotify`)

## ⚙️ Configuração Personalizada

### **📝 Arquivo de Configuração:**
O arquivo `config/config.conf` permite personalizar quais programas instalar:

```ini
[FUN_TOOLS]
# Ferramentas Divertidas
INSTALL_FUN_TOOLS=true
INSTALL_FORTUNE=true
INSTALL_COWSAY=true
INSTALL_CMATRIX=true
INSTALL_NYANCAT=true

[OSINT]
# Ferramentas OSINT
INSTALL_OSINT_TOOLS=true
INSTALL_HOLEHE=true
INSTALL_SHERLOCK=true
# ... outras ferramentas
```

### **💡 Como Usar:**
1. Edite `config/config.conf` antes de executar o script
2. Defina `false` para programas que não deseja instalar
3. Execute o script normalmente - ele respeitará suas configurações

### **🔧 Otimizações Automáticas:**
```ini
[KDE_OPTIMIZATIONS]
# Otimizações para KDE Plasma
DISABLE_KDE_WALLET=true          # Desativa KDE Wallet
OPTIMIZE_KDE_PERFORMANCE=true    # Otimiza performance
CONFIGURE_KDE_THEME=true         # Configura tema Breeze

[SYSTEM_OPTIMIZATIONS]
# Otimizações do Sistema
ENABLE_TRIM=true                 # Habilita TRIM para SSDs
OPTIMIZE_SWAP=true              # Otimiza configurações de swap
DISABLE_UNNECESSARY_SERVICES=true # Desabilita serviços desnecessários
OPTIMIZE_BOOT_TIME=true         # Otimiza tempo de boot

[GAMING_OPTIMIZATIONS]
# Otimizações específicas para jogos
ENABLE_GAMING_OPTIMIZATIONS=true # Habilita otimizações de jogos
INSTALL_MESA_DRIVERS=true       # Instala drivers Mesa otimizados (inclui correções para Intel)
CONFIGURE_MESA_PERFORMANCE=true # Configura Mesa para performance
OPTIMIZE_GPU_PERFORMANCE=true   # Otimiza performance da GPU
CONFIGURE_WINE_PERFORMANCE=true  # Configura Wine para jogos
ENABLE_GAMEMODE=true            # Habilita GameMode
CONFIGURE_STEAM_PERFORMANCE=true # Configura Steam para performance
OPTIMIZE_LUTRIS_SETTINGS=true   # Otimiza configurações do Lutris
CONFIGURE_DXVK=true             # Configura DXVK para melhor performance
ENABLE_VULKAN=true              # Habilita suporte Vulkan
CONFIGURE_OPENGL=true           # Configura OpenGL para performance
OPTIMIZE_MEMORY_GAMING=true     # Otimiza memória para jogos
DISABLE_COMPOSITOR_GAMING=true  # Desabilita compositor durante jogos
CONFIGURE_GAMING_MOUSE=true     # Configura mouse para jogos
ENABLE_GAMING_KEYBOARD=true     # Configura teclado para jogos
```

### **🎮 Otimizações de Jogos:**
O script inclui otimizações específicas para melhorar a performance em jogos:

#### **🔧 Drivers e Performance:**
- **Drivers Mesa** otimizados para melhor compatibilidade
- **Configurações de GPU** para modo performance
- **Vulkan** habilitado para jogos modernos
- **OpenGL** configurado para melhor performance

#### **🎯 Plataformas de Jogos:**
- **Steam** configurado para melhor performance
- **Lutris** otimizado para jogos não-Steam
- **Wine** configurado para jogos Windows
- **DXVK** habilitado para conversão DirectX → Vulkan

#### **⚡ GameMode:**
- **GameMode** instalado e configurado
- **Prioridade de CPU** otimizada durante jogos
- **Governor de CPU** ajustado para performance

#### **🖱️ Periféricos:**
- **Mouse** configurado para melhor responsividade
- **Teclado** otimizado para jogos
- **Compositor** desabilitado durante jogos (KDE)

#### **💾 Memória:**
- **Swap** otimizado para jogos
- **Cache de shaders** habilitado
- **Configurações de memória** ajustadas para jogos

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

## 🔒 Ferramentas de Segurança (Kali Linux)

### **🔧 Instalação Automática:**
- **Ferramentas profissionais** do Kali Linux
- **Testes de penetração** e auditoria de segurança
- **Instalação automática** de todas as ferramentas essenciais
- **Educacional:** Para aprendizado e testes éticos autorizados

### **⚠️ AVISO IMPORTANTE:**
> **Uso Ético:** Estas ferramentas são para fins educacionais e testes em sistemas autorizados. O uso não autorizado pode ser ilegal. Use responsavelmente!

### **💡 Exemplos de Uso:**

#### **Nmap - Scanner de Rede:**
```bash
# Scan básico
nmap 192.168.1.0/24

# Scan com detecção de serviços
nmap -sV 192.168.1.1

# Scan completo
nmap -A -T4 192.168.1.1
```

#### **Wireshark - Análise de Pacotes:**
```bash
# Iniciar interface gráfica
wireshark

# Captura em linha de comando
tshark -i eth0
```

#### **Hydra - Brute Force:**
```bash
# SSH brute force
hydra -l usuario -P senhas.txt ssh://192.168.1.1

# FTP brute force
hydra -l admin -P wordlist.txt ftp://192.168.1.1
```

#### **SQLMap - SQL Injection:**
```bash
# Testar URL para SQL injection
sqlmap -u "http://exemplo.com/page?id=1" --dbs

# Dump de banco de dados
sqlmap -u "http://exemplo.com/page?id=1" -D database --dump
```

## 🔍 Ferramentas de OSINT

### **🔧 Instalação Automática:**
- **Inteligência de Fontes Abertas** (OSINT)
- **Ferramentas instaladas** em `~/osint-tools/`
- **Investigação digital** e reconhecimento
- **Coleta de informações públicas** de forma automatizada

### **💡 Exemplos de Uso:**

#### **Sherlock - Busca de Username:**
```bash
# Buscar username em redes sociais
cd ~/osint-tools/sherlock
python3 sherlock/sherlock.py nome_usuario

# Salvar resultado em arquivo
python3 sherlock/sherlock.py nome_usuario -o resultado.txt
```

#### **theHarvester - Coleta de Emails:**
```bash
# Buscar emails de um domínio
cd ~/osint-tools/theHarvester
python3 theHarvester.py -d exemplo.com -b google

# Buscar em múltiplas fontes
python3 theHarvester.py -d exemplo.com -b all
```

#### **Maigret - Busca Avançada:**
```bash
# Buscar username em 2500+ sites
maigret nome_usuario

# Buscar com output em HTML
maigret nome_usuario --html

# Buscar com tags específicas
maigret nome_usuario --tags gaming,social
```

#### **Holehe - Verificação de Email:**
```bash
# Verificar se email está registrado em sites
holehe email@exemplo.com

# Verificar múltiplos emails
holehe email1@exemplo.com email2@exemplo.com

# Usar com timeout personalizado
holehe --timeout 10 email@exemplo.com
```

#### **GHunt - OSINT Google:**
```bash
# Investigar email do Google
ghunt email target@gmail.com

# Investigar número de telefone
ghunt phone +5511999999999
```

#### **PhoneInfoga - OSINT Telefone:**
```bash
# Investigar número de telefone
~/osint-tools/phoneinfoga/phoneinfoga scan -n "+5511999999999"

# Interface web
~/osint-tools/phoneinfoga/phoneinfoga serve
# Acesse: http://localhost:8080
```

#### **SpiderFoot - Automação OSINT:**
```bash
# Iniciar interface web
cd ~/osint-tools/spiderfoot
python3 sf.py -l 127.0.0.1:5001
# Acesse: http://127.0.0.1:5001
```

### **📁 Localização das Ferramentas:**
```
~/osint-tools/
├── sherlock/          # Busca de username
├── theHarvester/      # Coleta de emails
├── recon-ng/          # Framework de reconhecimento
├── spiderfoot/        # Automação OSINT
└── phoneinfoga/       # OSINT de telefone

# Ferramentas instaladas via pipx (disponíveis globalmente):
├── holehe/            # Verificação de email
├── maigret/           # Busca avançada de username
├── ghunt/             # OSINT Google
└── sqlmap/            # SQL injection
```

## 🪟 WinBoat - Execute Apps Windows no Linux

### **🔧 Instalação Automática:**
- **Interface elegante** para executar Windows no Linux
- **Instalação automatizada** do Windows através da interface
- **Integração perfeita** com seu desktop Linux
- **Executa qualquer app** que funciona no Windows
- **Open source** (licença MIT)

### **💡 Recursos:**

#### **Interface Elegante:**
- Interface intuitiva que integra Windows ao Linux
- Experiência nativa no desktop Linux
- Dashboard com todas as funcionalidades

#### **Instalação Automatizada:**
- Processo simples de instalação do Windows
- Configure preferências e especificações
- Deixe o WinBoat fazer o resto

#### **Execute Qualquer App:**
- Ferramentas de produtividade (Office, Adobe Suite)
- Aplicativos profissionais (Affinity, Acrobat)
- Jogos que não funcionam no Wine/Proton
- Software Windows em janelas nativas do OS

#### **Integração com Filesystem:**
- Diretório home montado no Windows
- Compartilhe arquivos facilmente entre sistemas
- Acesso transparente aos seus arquivos Linux

#### **Recursos Avançados:**
- Passthrough de USB (experimental desde v0.8.0)
- Passthrough de smartcard
- Monitoramento de recursos
- Suporte a periféricos via USB

### **💡 Uso Básico:**
```bash
# Executar WinBoat
~/Applications/WinBoat.AppImage

# Ou procure "WinBoat" no menu de aplicações
```

### **📝 Exemplos de Uso:**
- **Office 365:** Funciona perfeitamente ✅
- **Adobe Suite:** Photoshop, Illustrator, Premiere
- **Affinity:** Photo, Designer, Publisher
- **Paint Tool Sai:** Versões que não funcionam no Wine
- **AeroChat, Acrobat:** Apps específicos do Windows

### **🔗 Comparação:**

#### **vs Wine/CrossOver:**
- Executa apps que não funcionam bem no Wine
- Desktop Windows completo disponível
- Melhor compatibilidade com software Windows

#### **vs WinApps:**
- Setup completamente automatizado
- Interface unificada e coesa
- Experiência completa sem configurações manuais
- Sem necessidade de mexer em arquivos de configuração

### **⚠️ Observações:**
- **GPU Passthrough:** Planejado para futuras versões
- **Anti-cheat:** Jogos com anti-cheat kernel não funcionam (bloqueiam virtualização)
- **Podman:** Suporte planejado (atualmente requer Docker)

### **📖 Mais Informações:**
- Website: https://www.winboat.app/
- GitHub: https://github.com/WinBoat-App/WinBoat
- Licença: MIT (Open Source)

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

[SECURITY]
# Ferramentas de Segurança e Pentesting
INSTALL_SECURITY_TOOLS=true
INSTALL_NMAP=true
INSTALL_WIRESHARK=true
INSTALL_JOHN=true
INSTALL_HYDRA=true
INSTALL_AIRCRACK=true
INSTALL_SQLMAP=true
INSTALL_NIKTO=true
INSTALL_HASHCAT=true

[OSINT]
# Ferramentas de OSINT
INSTALL_OSINT_TOOLS=true
INSTALL_SHERLOCK=true
INSTALL_THEHARVESTER=true
INSTALL_RECONNG=true
INSTALL_SPIDERFOOT=true
INSTALL_GHUNT=true
INSTALL_PHONEINFOGA=true
INSTALL_MAIGRET=true
INSTALL_HOLEHE=true
```

Depois execute:
```bash
./auto-install.sh
```

## 🔧 Solução de Problemas

### **Problemas Comuns do KDE:**

#### **Spotify não abre após mudança de tema:**
```bash
# O script aplica correções automáticas, mas se necessário:
source ~/.bashrc
spotify
```

#### **Apps Flatpak com problemas de tema:**
```bash
# Reset configurações
flatpak override --reset com.spotify.Client
flatpak override --user --filesystem=home com.spotify.Client
```

#### **Variáveis Qt não configuradas:**
```bash
# Adicionar ao ~/.bashrc
export QT_QPA_PLATFORM=xcb
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
```

### **Outros Problemas:**

#### **VSCode não abre:**
```bash
# Verificar instalação
code --version
# Se não funcionar, reinstalar
sudo zypper install code  # openSUSE
sudo apt install code    # Debian/Ubuntu
```

#### **Docker sem sudo:**
```bash
# Adicionar usuário ao grupo docker
sudo usermod -aG docker $USER
# Fazer logout e login novamente
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
