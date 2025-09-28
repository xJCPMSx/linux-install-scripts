# Script de Instalação Automática - Debian/Ubuntu

## 📋 Descrição
Script automatizado para instalação de programas essenciais em sistemas baseados em Debian/Ubuntu, incluindo compiladores, ferramentas de desenvolvimento, navegadores, editores de código e jogos.

## 🎯 Programas Instalados

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** GCC, G++, Make, CMake, Ninja
- **Linguagens:** Java (OpenJDK), Node.js
- **Controle de Versão:** Git
- **Editores:** VSCode (via Flatpak), Cursor (AI)

### 🌐 **Navegadores**
- **Google Chrome** - Navegador principal
- **Brave Browser** - Navegador privado (via Flatpak)
- **Firefox** - Navegador alternativo

### 🎵 **Multimídia**
- **Spotify** - Streaming de música (via Flatpak/snap/repositório)
- **Osu!** - Jogo de ritmo (AppImage)

### 🛠️ **Ferramentas**
- **AnyDesk** - Acesso remoto
- **Driver Huion Tablet** - Suporte a tablets gráficos

## 🚀 Como Usar

### **Instalação Rápida:**
```bash
# Baixar o script
wget https://raw.githubusercontent.com/xJCPMSx/opensuse-install-script/main/debian/install-programs-debian.sh

# Tornar executável
chmod +x install-programs-debian.sh

# Executar
./install-programs-debian.sh
```

### **Instalação Manual:**
```bash
# Clonar o repositório
git clone https://github.com/xJCPMSx/opensuse-install-script.git
cd opensuse-install-script/debian

# Executar
./install-programs-debian.sh
```

## 📋 Pré-requisitos
- **Sistema:** Debian 11+, Ubuntu 20.04+, Linux Mint 20+, Pop!_OS 20.04+, Elementary OS 6+, Zorin OS 16+, Kali Linux Rolling
- **Permissões:** Acesso sudo
- **Conexão:** Internet estável

## 🔧 Funcionalidades

### **Instalação Automática:**
- ✅ Limpeza de repositórios conflitantes
- ✅ Repositórios necessários
- ✅ Chaves GPG
- ✅ Dependências do sistema
- ✅ Programas principais
- ✅ Configurações básicas

### **Configurações Incluídas:**
- ✅ Java com fallback múltiplo (11→17→21→default)
- ✅ Git com autenticação
- ✅ Ícones para Cursor e Osu!
- ✅ Extensões do VSCode

## 🎮 Jogos Incluídos
- **Osu!** - Jogo de ritmo com música
  - Baixado como AppImage
  - Ícone personalizado
  - Integração com sistema

## 🛠️ Ferramentas de Desenvolvimento
- **Compiladores completos** (GCC, G++, Make, CMake)
- **Java OpenJDK** com fallback inteligente
- **Node.js** com npm
- **Git** com configuração de autenticação
- **VSCode** via Flatpak (sem conflitos)
- **Cursor** (editor com IA)

## 🌐 Navegadores
- **Google Chrome** - Navegador principal
- **Brave Browser** - Foco em privacidade (via Flatpak)
- **Firefox** - Navegador alternativo

## 📱 Aplicativos
- **Spotify** - Streaming de música (múltiplos métodos)
- **AnyDesk** - Acesso remoto
- **Osu!** - Jogo de ritmo

## 🔧 Configurações Automáticas
- **Java** com fallback múltiplo para diferentes versões
- **Git** com configuração de autenticação
- **Ícones** para aplicativos personalizados
- **Extensões** do VSCode instaladas automaticamente
- **Limpeza** automática de conflitos de repositórios

## 📊 Compatibilidade
- ✅ **Debian 11+** (Bullseye, Bookworm)
- ✅ **Ubuntu 20.04+** (LTS e não-LTS)
- ✅ **Linux Mint 20+**
- ✅ **Pop!_OS 20.04+**
- ✅ **Elementary OS 6+**
- ✅ **Zorin OS 16+**
- ✅ **Kali Linux Rolling**

## 🎯 Características Especiais
- **VSCode via Flatpak** - Evita conflitos de repositórios
- **Java com fallback múltiplo** - 11→17→21→default
- **Spotify com fallback triplo** - Flatpak→snap→repositório
- **Limpeza automática** de conflitos de repositórios
- **Instalação robusta** com fallbacks inteligentes

## 🔧 Resolução de Problemas
- **Conflitos de repositórios:** Limpeza automática integrada
- **Java não encontrado:** Fallback para múltiplas versões
- **Spotify falha:** Múltiplos métodos de instalação
- **VSCode conflitos:** Instalação via Flatpak

## 📝 Notas
- O script detecta automaticamente a distribuição
- Instala apenas programas que não estão presentes
- Configura automaticamente as alternativas do Java
- Cria ícones personalizados para aplicativos
- Resolve automaticamente conflitos de repositórios

## 🔗 Links Úteis
- **Repositório:** https://github.com/xJCPMSx/opensuse-install-script
- **Issues:** https://github.com/xJCPMSx/opensuse-install-script/issues
- **Documentação:** Este README

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
**🎉 Desenvolvido para facilitar a configuração de ambientes de desenvolvimento em sistemas baseados em Debian/Ubuntu!**
