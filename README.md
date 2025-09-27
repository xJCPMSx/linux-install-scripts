# Scripts de Instalação Automática - Linux

Scripts automatizados para instalação de programas essenciais em diferentes distribuições Linux.

## 🐧 Distribuições Suportadas

### openSUSE
- **Script:** `opensuse/install-programs.sh`
- **Documentação:** `docs/README.md`
- **Sistemas:** openSUSE Leap, Tumbleweed

### Debian/Ubuntu
- **Script:** `debian/install-programs-debian.sh`
- **Documentação:** `docs/README-DEBIAN.md`
- **Sistemas:** Debian, Ubuntu, Linux Mint, Pop!_OS, Elementary OS, Zorin OS, Kali Linux

## 📁 Estrutura do Projeto

```
├── opensuse/                    # Scripts para openSUSE
│   └── install-programs.sh
├── debian/                      # Scripts para Debian/Ubuntu
│   └── install-programs-debian.sh
├── scripts/                     # Scripts auxiliares
│   └── upload-to-github.sh
├── docs/                       # Documentação
│   ├── README.md
│   └── README-DEBIAN.md
├── .gitignore
└── README.md                    # Este arquivo
```

## 🚀 Como Usar

### Para openSUSE:
```bash
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/opensuse/install-programs.sh
chmod +x install-programs.sh
./install-programs.sh
```

### Para Debian/Ubuntu:
```bash
wget https://raw.githubusercontent.com/xJCPMSx/linux-install-scripts/main/debian/install-programs-debian.sh
chmod +x install-programs-debian.sh
./install-programs-debian.sh
```

## 📦 Programas Instalados

### openSUSE
- AnyDesk, Spotify, VSCode, Chrome, Brave, Java, Node.js
- Firefox, Cursor, Osu!
- Compiladores e ferramentas de desenvolvimento
- Driver da Huion Tablet

### Debian/Ubuntu
- AnyDesk, Spotify, VSCode, Chrome, Brave, Java, Node.js
- Firefox, Cursor, Osu!
- Compiladores e ferramentas de desenvolvimento
- Driver da Huion Tablet

## 🔧 Funcionalidades

- **Instalação automática** de programas essenciais
- **Configuração de repositórios** necessários
- **Instalação de dependências** de desenvolvimento
- **Configuração do Git** com autenticação
- **Criação de ícones** para aplicativos AppImage
- **Limpeza automática** de conflitos de repositórios (Debian/Ubuntu)

## 📋 Requisitos

- Sistema Linux suportado
- Acesso de administrador (sudo)
- Conexão com a internet
- Git configurado (opcional)

## 🤝 Contribuições

1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 🔗 Links

- **Repositório:** https://github.com/xJCPMSx/linux-install-scripts
- **Issues:** https://github.com/xJCPMSx/linux-install-scripts/issues
- **Releases:** https://github.com/xJCPMSx/linux-install-scripts/releases