# Dockerfile para Linux Install Scripts
# Versão: 1.0-beta
# Data: 2025-09-28

# Usar imagem base do Ubuntu para compatibilidade
FROM ubuntu:22.04

# Metadados
LABEL maintainer="xJCPMSx"
LABEL version="1.0-beta"
LABEL description="Linux Install Scripts - Containerizado"

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo
ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR:pt
ENV LC_ALL=pt_BR.UTF-8

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    tree \
    unzip \
    tar \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Instalar Java
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    openjdk-11-jre \
    && rm -rf /var/lib/apt/lists/*

# Instalar compiladores
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    make \
    cmake \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

# Instalar VSCode
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
    && install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ \
    && sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update \
    && apt-get install -y code \
    && rm -rf /var/lib/apt/lists/*

# Instalar Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Instalar Firefox
RUN apt-get update && apt-get install -y firefox \
    && rm -rf /var/lib/apt/lists/*

# Instalar Flatpak
RUN apt-get update && apt-get install -y flatpak \
    && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
    && rm -rf /var/lib/apt/lists/*

# Instalar Spotify via Flatpak
RUN flatpak install -y flathub com.spotify.Client

# Instalar Brave Browser via Flatpak
RUN flatpak install -y flathub com.brave.Browser

# Criar usuário não-root
RUN useradd -m -s /bin/bash developer \
    && usermod -aG sudo developer \
    && echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configurar diretório de trabalho
WORKDIR /home/developer/workspace

# Copiar scripts
COPY . /home/developer/linux-install-scripts/
RUN chown -R developer:developer /home/developer/linux-install-scripts

# Configurar Git
RUN git config --global user.name "Developer" \
    && git config --global user.email "developer@example.com"

# Expor portas (se necessário)
EXPOSE 3000 8080 5000

# Comando padrão
CMD ["/bin/bash"]
