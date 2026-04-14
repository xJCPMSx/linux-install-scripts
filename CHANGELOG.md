# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [1.1.0] - 2026-04-14

### Adicionado
- **Otimizações de jogos para openSUSE Tumbleweed** (`optimize_gaming`)
  - Detecção automática de GPU Intel/AMD/NVIDIA
  - Instalação de drivers Mesa e Vulkan otimizados
  - Configuração de variáveis de ambiente para Mesa (GL_VERSION_OVERRIDE, GLSL_VERSION_OVERRIDE)
  - GameMode para otimização de recursos do sistema
  - Configurações específicas para Steam, Lutris, Heroic Games Launcher
  - Configuração de DXVK para jogos DirectX no Linux
  - Otimizações de memória para jogos (dirty_ratio, dirty_background_ratio)
  - Desabilitar compositor durante jogos (KDE)

- **Suporte a config.conf** (`load_config`)
  - Carregamento de configurações personalizadas
  - Variáveis de ambiente configuráveis
  - Controle granular de funcionalidades

- **Plataformas de jogos**
  - Steam (instalação nativa e Flatpak)
  - Lutris (gerenciador de jogos)
  - Heroic Games Launcher (Epic Games & GOG)
  - WinBoat (aplicativos Windows no Linux)
  - FreeRDP (dependência do WinBoat)
  - Osu! (jogo de ritmo)

- **Ferramentas de segurança e OSINT**
  - Nmap (scanner de rede)
  - Wireshark (análise de pacotes)
  - John the Ripper (quebra de senhas)
  - Hydra (brute force)
  - Aircrack-ng (segurança WiFi)
  - SQLMap (SQL injection)
  - Nikto (scanner web)
  - Hashcat (quebra de hash)
  - Gobuster (directory/DNS bruteforce)
  - ffuf (fuzzing web)
  - Holehe (OSINT de email)

- **Otimizações do KDE Plasma**
  - Desativar KDE Wallet
  - Otimizar compositor (OpenGL)
  - Configurar tema Breeze

- **Otimizações do sistema**
  - Habilitar TRIM para SSDs
  - Otimizar swappiness
  - Desabilitar serviços desnecessários (bluetooth, cups, avahi-daemon)
  - Otimizar tempo de boot (GRUB_TIMEOUT)

- **Script de desinstalação** (`uninstall.sh`)
  - Remoção completa de programas instalados

### Changed
- **Execução não-interativa**
  - openSUSE: `zypper --non-interactive --no-confirm --allow-vendor-change`
  - Debian: `DEBIAN_FRONTEND=noninteractive`
  - Dpkg: `--force-confdef --force-confold` para manter configurações

- **Correção de nomes de pacotes Vulkan**
  - `Mesa vulkan-tools` -> lista expandida de pacotes
  - `vulkan-validationlayers` -> `libvulkan1`

- **Correção de nomes de pacotes Mesa**
  - `Mesa-libGL1` -> lista completa de pacotes
  - Verificação de instalação antes de instalar

- **Melhoria na instalação do WinBoat**
  - Atualização forçada do menu KDE (`kbuildsycoca5`)
  - Correção de versão usada (v0.8.5)
  - Criação de desktop file e ícone SVG

- **Melhoria na instalação do Brave**
  - Fallback para Flatpak se repositório falhar

- **Correção do Sherlock**
  - Instalação via `pip install .` em vez de requirements.txt

- **Correção de ferramentas divertidas**
  - `fortune-mod` em vez de `fortune` (Debian)
  - `nyancat` nos repositórios

- **Correção de CI/CD**
  - Parâmetros apropriados para auto-install.sh
  - Correção de aliases Flatpak

- **Correção de erros ShellCheck**
  - SC2129: Redirecionamento de múltiplos comandos
  - SC2086: Aspas em variáveis de comandos

### Fixed
- **Instalação duplicada de drivers Mesa** (openSUSE)
  - Removida redundância na função `optimize_gaming`
  - Verificação antes de instalar

- **Nome do driver de aceleração Intel**
  - `intel-vaapi-driver` (nome primário de pacote)
  - Verificação de pré-existência

- **Lógica de remoção do driver xf86-video-intel**
  - Verifica se está instalado antes de remover
  - Tratamento de erros adequado

- **Limpeza de GPUCache**
  - Verificação de existência do diretório `/home`
  - Tratamento de erros silencioso

- **Conflictos de repositórios Debian**
  - Limpeza agressiva de repositórios conflitantes
  - Remoção de chaves GPG conflitantes

- **Instalação do Java**
  - Fallback: OpenJDK 11 -> 17 -> 21 -> default-jdk

- **Instalação do VSCode**
  - Via Flatpak para evitar conflitos com apt

- **Correção de URL do WinBoat**
  - URL estável usada no commit

### Removed
- **Script depreciado** `fix_grafics.sh`
  - Funcionalidades integradas ao script principal do openSUSE
  - Função `fix_intel_graphics` adicionada

---

## [1.0-beta] - 2025-09-28

### ⚠️ VERSÃO BETA - TESTES
Esta é uma versão beta para testes. Funcionalidades podem mudar antes da versão estável.

### Added
- **Scripts de instalação** - openSUSE e Debian/Ubuntu
- **Detecção automática** - `auto-install.sh` identifica distribuição
- **Script de desinstalação** - `uninstall.sh` remove programas
- **Suporte multilíngue** - READMEs em inglês e português
- **Badges informativos** - Status de distribuições suportadas
- **Licença MIT** - Arquivo LICENSE
- **CHANGELOG** - Histórico de versões

### Improved
- **Documentação** - READMEs organizados e informativos
- **Visual** - Badges coloridos e profissionais
- **Acessibilidade** - Suporte internacional
- **Estrutura** - Organização em subpastas

### Fixed
- **Conflitos de repositórios** - Limpeza automática no Debian
- **Instalação do Java** - Fallback inteligente para múltiplas versões
- **VSCode** - Instalação via Flatpak para evitar conflitos
- **Spotify** - Múltiplos métodos de instalação

---

## [Próximas Versões]

### [1.2] - Planejado
- Suporte a mais distribuições (Arch Linux, Fedora)
- Backup e restauração de configurações
- Logs detalhados para troubleshooting

### [2.0] - Planejado
- Interface gráfica (GUI) para seleção de programas
- Configuração personalizada persistente
- Testes automáticos (CI/CD)

---

## Nota sobre Contribuição

### Como Contribuir
1. Fork o repositório
2. Crie uma branch para sua feature
3. Faça commit das mudanças (seguir Conventional Commits)
4. Abra um Pull Request

### Reportar Bugs
- Use o sistema de Issues do GitHub
- Inclua informações do sistema (distribuição, versão)
- Descreva o problema detalhadamente

### Sugestões
- Abra uma Issue com a tag "enhancement"
- Descreva a funcionalidade desejada
- Explique o benefício para os usuários

---

**Obrigado por usar os Scripts de Instalação Linux!**