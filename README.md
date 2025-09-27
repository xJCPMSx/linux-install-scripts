# 🚀 Script de Instalação Automática - openSUSE

Este repositório contém scripts para instalação automática de programas essenciais no openSUSE, incluindo editores, navegadores, ferramentas de desenvolvimento e drivers.

## 📋 Programas Instalados

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
- **Compiladores:** gcc, gcc-c++, cmake, ninja, git, meson
- **Dependências:** glib2-devel, libgusb-devel, gobject-introspection-devel, cairo-devel, libopenssl-devel, libgudev-1_0-devel, gtk-doc
- **Ferramentas adicionais:** curl, wget, unzip, tar, vim, nano, htop, neofetch, tree, file, which, make, autoconf, automake, libtool, pkg-config

### 🎨 **Drivers e Hardware**
- **Driver Huion Tablet** - Suporte para tablets gráficos Huion
- **Dependências libfprint** - Para leitores de impressão digital

### ⚙️ **Configuração Automática**
- **Git** - Verificação e configuração de credenciais
- **SSH** - Verificação de chaves SSH para GitHub
- **Java** - Configuração como alternativa padrão

## 🚀 Como Usar

### Instalação Completa
```bash
# Execute o script principal (instalação completa)
./install-programs.sh
```

### Teste de Repositórios (Opcional)
```bash
# Teste a disponibilidade dos programas sem instalar
./install-programs.sh --test
```

### Ajuda
```bash
# Mostrar opções disponíveis
./install-programs.sh --help
```

## 📁 Estrutura dos Arquivos

```
📦 Script pós instalação/
├── 📄 install-programs.sh    # Script principal (tudo em um)
├── 📄 setup-libfprint.sh     # Script original para libfprint
└── 📄 README.md              # Este arquivo
```

## ✨ Características do Script

### 🔍 **Verificações Inteligentes**
- Verifica se repositórios já existem antes de adicionar
- Testa disponibilidade de programas nos repositórios
- Fallback automático para download direto quando necessário
- Limpeza automática de repositórios problemáticos

### 🛡️ **Instalação Robusta**
- Verificação de sucesso para cada instalação
- Mensagens informativas sobre o status de cada operação
- Opções de linha de comando para teste e ajuda
- Tudo em um único script

### 🎯 **Instalação Específica por Programa**

#### **Spotify**
- Instalação via **Flatpak** (mais confiável que repositórios RPM)
- Configuração automática do repositório Flathub

#### **Cursor**
- Verificação nos repositórios primeiro
- **Suporte a AppImage** - detecta se já está instalado como AppImage
- **Detecção por diretório** - reconhece instalação via diretório `.cursor`
- Download direto do site oficial se necessário
- **AppImage:** `https://download.cursor.sh/linux/appImage/x64`
- **RPM:** `https://download.cursor.sh/linux/rpm/x86_64`

#### **Brave Browser**
- **Instalação via Flatpak** (método preferido)
- **Download direto** se Flatpak falhar
- **URL:** `https://brave-browser-rpm-release.s3.brave.com/brave-browser-stable.rpm`

#### **Firefox**
- **Instalação via Flatpak** (método preferido)
- **Instalação via zypper** se Flatpak falhar
- **Pacote:** `MozillaFirefox`

#### **AnyDesk**
- Verificação de disponibilidade nos repositórios
- Download direto se não encontrado

#### **Driver Huion**
- Verificação de disponibilidade
- Instruções para instalação manual se necessário

#### **Ícones no Menu do Sistema**
- **Cursor:** Aparece em "Desenvolvimento" ou "Utilitários"
- **Osu!:** Aparece em "Jogos"
- **Firefox:** Aparece em "Rede" ou "Navegadores"
- **Arquivos:** `~/.local/share/applications/` e `~/.local/share/icons/`
- **Atualização:** Automática após execução do script

## 🔧 Pós-Instalação

### Configurações Recomendadas

1. **Reinicie o sistema** para garantir que todos os drivers funcionem
2. **Configure o Git:**
   ```bash
   git config --global user.name "Seu Nome"
   git config --global user.email "seu.email@exemplo.com"
   ```
3. **Teste os programas instalados**

### Teste do libfprint
```bash
# Para testar o leitor de impressão digital
fprintd-enroll
```

### Configuração do Git
```bash
# Configuração básica do Git
git config --global user.name 'Seu Nome'
git config --global user.email 'seu.email@exemplo.com'

# Configuração completa com GitHub (recomendado)
/home/juca/Documentos/Gerenciar Git/configurar-github.sh
```

## 🐛 Solução de Problemas

### Repositórios Problemáticos
Se encontrar erros com repositórios:
```bash
./clean-repos.sh
./install-programs.sh
```

### Verificação de Instalação
```bash
# Verificar versões instaladas
java -version
node --version
npm --version
git --version
```

## 📝 Requisitos

- **Sistema:** openSUSE Tumbleweed
- **Permissões:** sudo (para instalação de pacotes)
- **Conexão:** Internet para download de pacotes

## 🤝 Contribuições

Para adicionar novos programas ao script:

1. Edite `install-programs.sh`
2. Adicione a verificação de disponibilidade
3. Inclua fallback para download direto se necessário
4. Atualize a lista de programas no final do script

## 📄 Licença

Este projeto é de uso livre. Sinta-se à vontade para modificar e distribuir conforme necessário.

---

**Desenvolvido para facilitar a configuração inicial do openSUSE** 🐧✨
