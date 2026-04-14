# Scripts de Instalação Linux

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-11%2B-13-A80030?logo=debian)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-24.04%2B-E95420?logo=ubuntu)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.1--stable-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)

## 🌍 Languages / Idiomas

- [🇺🇸 English](README-EN.md)
- [🇧🇷 Português](README.md) *(Atual)*

## 📋 Descrição

Coleção de scripts automatizados para instalação de programas essenciais em diferentes distribuições Linux, incluindo compiladores, ferramentas de desenvolvimento, ferramentas de IA, navegadores, editores de código e aplicativos.

## ✅ Distribuições Suportadas

### **openSUSE**
- ✅ **openSUSE Leap 15.3+**
- ✅ **openSUSE Tumbleweed**
- ✅ **SUSE Linux Enterprise**

### **Debian/Ubuntu**
- ✅ **Debian 11+** (Bullseye, Bookworm, Trixie)
- ✅ **Ubuntu 20.04+** (LTS e não-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Scripts Disponíveis

### **🖥️ Instalação Automática (Recomendado):**
```bash
# Detecção automática de distribuição
git clone https://github.com/xJCPMSx/linux-install-scripts.git
cd linux-install-scripts
./auto-install.sh
```

### **📋 Instalação Manual por Distribuição:**

| Distribuição | Script | Status |
|--------------|--------|--------|
| **Debian/Ubuntu** | `debian/install-programs-debian.sh` | ✅ Estável v1.1 |
| **openSUSE** | `opensuse/install-programs-opensuse.sh` | ✅ Estável v1.1 |

### **🗑️ Desinstalação:**
```bash
./uninstall.sh
```

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

## 🎯 Recursos Principais

### **🚀 Instalação Inteligente:**
- ✅ Detecção automática de distribuição Linux
- ✅ Instalação seletiva - apenas programas não instalados
- ✅ Fallback robusto - múltiplas fontes (repositórios, Flatpak, Snap, AppImage)
- ✅ Limpeza automática de conflitos de repositórios
- ✅ Mensagens informativas durante todo o processo

### **🤖 Ferramentas de IA (v1.1-stable):**
- ✅ Antigravity - Ferramenta de IA via Python/PIP
- ✅ Claude Code - CLI oficial da Anthropic para engenharia de software assistida por IA
- ✅ OpenCode - Extensões de desenvolvimento

### **💻 Editores de Código:**
- ✅ VSCode - Editor via Flatpak
- ✅ Cursor - Editor com IA (AppImage)

### **🖥️ Ferramentas do Sistema:**
- ✅ Fastfetch/Neofetch - Informações do sistema (detecção automática)
- ✅ yt-dlp - Download de vídeos
- ✅ Docker e Docker Compose - Containerização

### **🔒 Segurança & OSINT:**
- ✅ Nmap, Wireshark, John the Ripper, Hydra, Aircrack-ng
- ✅ SQLMap, Nikto, Hashcat, Gobuster, ffuf
- ✅ SpiderFoot, Sherlock, theHarvester, GHunt, Holehe, Maigret, PhoneInfoga

### **🎮 Otimização para Jogos:**
- ✅ Steam, Lutris, Heroic, Osu!, WinBoat
- ✅ GameMode, DXVK, Vulkan (retrocompatível)
- ✅ Otimização de GPU e Memória

### **🔧 Configuração Automática:**
- ✅ Docker e Docker Compose com usuário no grupo
- ✅ Driver Oficial da Huion para tablets
- ✅ WireGuard VPN
- ✅ TRIM automático para SSDs
- ✅ Java, Git, Node.js configurados automaticamente

## 📖 Guias de Uso Rápido

### **📂 Localização das Ferramentas OSINT**

As ferramentas de OSINT e Segurança são instaladas em:
```
~/osint-tools/
```

**Ferramentas disponíveis globalmente:**
- `sherlock`, `maigret`, `holehe` → Execute via `python3 ~/osint-tools/ferramenta.py`
- `theHarvester` → Disponível globalmente via pip
- `sf` (SpiderFoot) → Disponível globalmente via pip

---

### **🔎 Sherlock - Busca de Username**

```bash
# Busca básica
python3 ~/osint-tools/sherlock/sherlock.py usuario

# Saída JSON
python3 ~/osint-tools/sherlock/sherlock.py usuario --json

# Salvar resultados
python3 ~/osint-tools/sherlock/sherlock.py usuario --output resultados.txt
```

### **🕷️ SpiderFoot - OSINT Automatizado**

```bash
# Iniciar interface web (porta 5001)
sf -s 127.0.0.1

# CLI
sfcli -s example.com -M sfp_arin -M sfp_dnsresolv
```
**Acesse:** http://localhost:5001 para interface gráfica

### **🎯 Maigret - Busca Avançada de Username**

```bash
# Busca detalhada
python3 ~/osint-tools/maigret/maigret.py usuario

# Com screenshots
python3 ~/osint-tools/maigret/maigret.py usuario -v
```

### **📞 PhoneInfoga - OSINT de Telefone**

```bash
# Scan básico
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999

# Scan completo
python3 ~/osint-tools/phoneinfoga/phoneinfoga.py -n +5511999999999 -i
```

### **🛡️ Nmap - Scanner de Rede**

```bash
# Scan básico
nmap 192.168.1.1

# Scan completo com detecção de serviços
nmap -sV -sC -p- 192.168.1.1

# Scan de rede inteira
nmap -sP 192.168.1.0/24
```

### **💉 SQLMap - SQL Injection**

```bash
# Testar URL
sqlmap -u "http://alvo.com/pagina.php?id=1"

# Enumeração de databases
sqlmap -u "http://alvo.com/pagina.php?id=1" --dbs

# Extrair dados
sqlmap -u "http://alvo.com/pagina.php?id=1" -D db -T usuarios --dump
```

### **🔓 Hydra - Brute Force**

```bash
# SSH brute force
hydra -l usuario -P wordlist.txt ssh://192.168.1.1

# HTTP POST
hydra -l admin -P wordlist.txt 192.168.1.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=incorrect"
```

---

## 🧠 Inteligência de Fallback

### **Fastfetch / Neofetch**

O script detecta automaticamente o sistema operacional e instala a ferramenta de informações mais adequada:

| Sistema | Ferramenta |
|---------|------------|
| **Debian 13+** | Fastfetch |
| **Ubuntu 24.04+** | Fastfetch |
| **Debian 11/12** | Neofetch (fallback) |
| **Ubuntu 20.04/22.04** | Neofetch (fallback) |
| **openSUSE** | Fastfetch |

**Lógica implementada:**
```bash
source /etc/os-release
if [[ "$ID" == "debian" && "${VERSION_ID%%.*}" -ge 13 ]] || [[ "$ID" == "ubuntu" && "${VERSION_ID%%.*}" -ge 24 ]]; then
    apt_install fastfetch
else
    apt_install neofetch
fi
```

---

## 📝 Notas Importantes

- ✅ Scripts testados e funcionais (v1.1-stable)
- ✅ Retrocompatibilidade com Debian 11, Ubuntu 20.04+
- ✅ Suporte completo ao Debian 13 (Trixie)
- ✅ Ferramentas de IA: Antigravity, Claude Code
- ✅ Fallback inteligente para Fastfetch/Neofetch
- ⚠️ Reinicialização recomendada após Docker e Driver Huion

## 📄 Licença

Este projeto está sob a licença MIT. See [LICENSE](LICENSE) for more details.

---

**🎉 Scripts desenvolvidos para facilitar a configuração de ambientes de desenvolvimento em Linux!**