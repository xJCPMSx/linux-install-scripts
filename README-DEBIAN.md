# 🐧 Script de Instalação Automática - Debian/Ubuntu

Script automatizado para instalação de programas essenciais em sistemas baseados em Debian/Ubuntu.

## 📦 **Programas Instalados**

### 🎯 **Programas Principais**
- **AnyDesk** - Acesso remoto
- **Spotify** - Música (via Flatpak)
- **VSCode** - Editor de código com extensões úteis
- **Cursor** - Editor com IA integrada
- **Google Chrome** - Navegador web
- **Brave Browser** - Navegador alternativo
- **Firefox** - Navegador alternativo
- **Java (OpenJDK 11)** - Runtime Java
- **Node.js e npm** - Runtime JavaScript
- **Osu!** - Jogo de ritmo (via Flatpak ou AppImage)
- **Ícones no Menu** - Criação automática de ícones para Cursor e Osu!

### 🔧 **Ferramentas de Desenvolvimento**
- **Compiladores:** gcc, g++, make, cmake, ninja-build, git
- **Dependências:** libglib2.0-dev, libgusb-dev, libgobject-introspection-dev, libcairo2-dev, libssl-dev, libgudev-1.0-dev, gtk-doc-tools
- **Ferramentas adicionais:** curl, wget, unzip, tar, vim, nano, htop, neofetch, tree, file, which, pkg-config, autoconf, automake, libtool

## 🚀 **Como Usar**

### **Instalação Rápida**
```bash
# Baixar e executar o script
wget https://raw.githubusercontent.com/xJCPMSx/opensuse-install-script/main/install-programs-debian.sh
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

### **Instalação Manual**
```bash
# Clonar o repositório
git clone https://github.com/xJCPMSx/opensuse-install-script.git
cd opensuse-install-script

# Executar script do Debian
./install-programs-debian.sh
```

## 🔧 **Diferenças da Versão openSUSE**

### **Gerenciador de Pacotes**
- **openSUSE:** `zypper` + `rpm`
- **Debian/Ubuntu:** `apt` + `dpkg`

### **Repositórios**
- **openSUSE:** `zypper addrepo`
- **Debian/Ubuntu:** `add-apt-repository` + chaves GPG

### **Instalação de Pacotes**
- **openSUSE:** `zypper install`
- **Debian/Ubuntu:** `apt install`

### **Configuração Java**
- **openSUSE:** `alternatives --install`
- **Debian/Ubuntu:** `update-alternatives --install`

## 📋 **Requisitos**

### **Sistemas Suportados**
- ✅ **Ubuntu** 20.04+ (LTS e não-LTS)
- ✅ **Debian** 11+ (Bullseye, Bookworm)
- ✅ **Linux Mint** 20+
- ✅ **Pop!_OS** 20.04+
- ✅ **Elementary OS** 6+
- ✅ **Zorin OS** 16+

### **Pré-requisitos**
- Conexão com internet
- Acesso sudo/root
- Pelo menos 2GB de espaço livre
- Arquitetura x86_64 (amd64)

## 🛠️ **Funcionalidades Específicas**

### **Repositórios Automáticos**
- **Microsoft VSCode** - Repositório oficial
- **Google Chrome** - Repositório oficial
- **Brave Browser** - Repositório oficial
- **NodeSource** - Para Node.js LTS
- **Flathub** - Para aplicações Flatpak

### **Chaves GPG**
- Importação automática de chaves GPG
- Configuração de repositórios seguros
- Verificação de assinaturas

### **Detecção Inteligente**
- Verifica instalações existentes
- Evita reinstalações desnecessárias
- Fallbacks para diferentes métodos

## 🎨 **Ícones no Menu**

### **Aplicativos com Ícones**
- **Cursor** - Aparece em "Desenvolvimento" ou "Utilitários"
- **Osu!** - Aparece em "Jogos"
- **Arquivos:** `~/.local/share/applications/` e `~/.local/share/icons/`

### **Atualização Automática**
- Base de dados desktop atualizada
- Ícones aparecem imediatamente
- Suporte a múltiplos ambientes desktop

## 🔧 **Pós-Instalação**

### **Configurações Recomendadas**

1. **Reinicie o sistema** para garantir que todos os drivers funcionem
2. **Configure o Git:**
   ```bash
   git config --global user.name 'Seu Nome'
   git config --global user.email 'seu.email@exemplo.com'
   ```
3. **Configure SSH (opcional):**
   ```bash
   ssh-keygen -t ed25519 -C 'seu.email@exemplo.com'
   ```
4. **Teste os programas instalados**

### **Comandos Úteis**

#### **Verificar Instalações**
```bash
# Verificar versões
java -version
node --version
npm --version
git --version

# Verificar programas
code --version
cursor --version
google-chrome --version
```

#### **Gerenciar Flatpak**
```bash
# Listar aplicações instaladas
flatpak list

# Atualizar aplicações
flatpak update

# Remover aplicação
flatpak uninstall com.spotify.Client
```

## 🐛 **Solução de Problemas**

### **Problemas Comuns**

#### **Erro de Permissões**
```bash
# Executar com sudo se necessário
sudo ./install-programs-debian.sh
```

#### **Repositórios Não Funcionam**
```bash
# Atualizar chaves GPG
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys [CHAVE]
```

#### **Flatpak Não Funciona**
```bash
# Reinstalar Flatpak
sudo apt remove flatpak
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### **Logs de Instalação**
```bash
# Ver logs do apt
sudo cat /var/log/apt/history.log

# Ver logs do sistema
journalctl -f
```

## 📊 **Comparação de Versões**

| Recurso | openSUSE | Debian/Ubuntu |
|---------|----------|---------------|
| Gerenciador | zypper | apt |
| Repositórios | zypper addrepo | add-apt-repository |
| Chaves GPG | rpm --import | apt-key |
| Alternativas | alternatives | update-alternatives |
| Flatpak | ✅ | ✅ |
| AppImage | ✅ | ✅ |
| Ícones | ✅ | ✅ |

## 🤝 **Contribuição**

### **Como Contribuir**
1. Fork o repositório
2. Crie uma branch para sua feature
3. Faça commit das mudanças
4. Abra um Pull Request

### **Reportar Bugs**
- Use as Issues do GitHub
- Inclua logs de erro
- Especifique sua distribuição

## 📄 **Licença**

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 🙏 **Agradecimentos**

- Comunidade openSUSE
- Comunidade Debian/Ubuntu
- Desenvolvedores dos programas incluídos
- Contribuidores do projeto

---

**🎉 Aproveite sua instalação automatizada!** 🎉
