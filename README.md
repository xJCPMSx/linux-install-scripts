# Scripts de Instalação Linux

[![Linux](https://img.shields.io/badge/Linux-Supported-green.svg)](https://github.com/xJCPMSx/linux-install-scripts)
[![openSUSE](https://img.shields.io/badge/openSUSE-Supported-blue.svg)](https://www.opensuse.org/)
[![Debian](https://img.shields.io/badge/Debian-11%2B-13%2B-A80030?style=flat&logo=debian)](https://www.debian.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-E95420?style=flat&logo=ubuntu)](https://ubuntu.com/)
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
- ✅ **Debian 11+** (Bullseye, Bookworm, **Trixie**)
- ✅ **Ubuntu 20.04+** (LTS e não-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Scripts Disponíveis

### **🖥️ Instalação Automática:**
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
| **openSUSE** | `opensuse/install-programs-opensuse.sh` | ✅ Estável |

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
- ✅ Claude Code - CLI oficial da Anthropic
- ✅ OpenCode - Extensões de desenvolvimento

### **🔒 Segurança & OSINT:**
- ✅ Nmap, Wireshark, John, Hydra, Aircrack-ng
- ✅ SQLMap, Nikto, Hashcat, Gobuster, ffuf
- ✅ SpiderFoot, Sherlock, theHarvester, GHunt, Holehe

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

## 📝 Notas Importantes

- ✅ Scripts testados e funcionais
- ✅ Retrocompatibilidade com Debian 11, Ubuntu 20.04+
- ✅ Suporte completo ao Debian 13 (Trixie)
- ⚠️ Reinicialização recomendada após Docker e Driver Huion

## 📄 Licença

Este projeto está sob a licença MIT. See [LICENSE](LICENSE) for more details.

---

**🎉 Scripts desenvolvidos para facilitar a configuração de ambientes de desenvolvimento em Linux!**