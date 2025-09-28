# Dockerfile para Linux Installation Scripts
# Containerização para testes e desenvolvimento

FROM ubuntu:22.04

# Metadados
LABEL maintainer="xJCPMSx"
LABEL description="Linux Installation Scripts - Container para testes"
LABEL version="1.0"

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo
ENV LOG_LEVEL=INFO

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    tar \
    unzip \
    gnupg \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    build-essential \
    gcc \
    g++ \
    make \
    cmake \
    ninja-build \
    pkg-config \
    autoconf \
    automake \
    libtool \
    vim \
    nano \
    htop \
    tree \
    neofetch \
    file \
    && rm -rf /var/lib/apt/lists/*

# Criar usuário não-root
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configurar diretório de trabalho
WORKDIR /home/developer/linux-install-scripts

# Copiar scripts
COPY . .

# Definir permissões
RUN chmod +x *.sh && \
    chmod +x opensuse/*.sh && \
    chmod +x debian/*.sh

# Criar diretórios necessários
RUN mkdir -p /home/developer/.linux-install-scripts/logs && \
    mkdir -p /home/developer/.linux-install-scripts/backup && \
    mkdir -p /home/developer/Applications

# Configurar Git
RUN git config --global user.name "Developer" && \
    git config --global user.email "developer@example.com"

# Expor portas (se necessário)
EXPOSE 8080

# Comando padrão
CMD ["/bin/bash"]

# Instruções de uso
# docker build -t linux-install-scripts .
# docker run -it linux-install-scripts
# docker run -it -v $(pwd):/workspace linux-install-scripts
