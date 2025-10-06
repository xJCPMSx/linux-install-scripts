#!/bin/bash

# Script para fazer commit e push das mudanças
cd "/home/juca/Documentos/Scipt pós instalação"

echo "🚀 Iniciando processo de commit e push..."

# Verificar se é um repositório Git
if [ ! -d ".git" ]; then
    echo "📁 Inicializando repositório Git..."
    git init
fi

# Adicionar todos os arquivos
echo "📦 Adicionando arquivos..."
git add .

# Fazer commit
echo "💾 Fazendo commit..."
git commit -m "feat: Adicionar ferramentas de segurança, OSINT e divertidas

- Adicionar ferramentas Kali Linux (Nmap, Wireshark, SQLMap, Nikto, Hashcat, Gobuster, ffuf)
- Adicionar ferramentas OSINT (Sherlock, theHarvester, Recon-ng, SpiderFoot, GHunt, PhoneInfoga, Maigret)
- Adicionar ferramentas divertidas (fortune, cowsay, cmatrix, nyancat)
- Adicionar WinBoat para executar aplicativos Windows no Linux
- Implementar timeouts para evitar travamentos nas extensões VSCode
- Adicionar ambientes virtuais para ferramentas Python (venv)
- Corrigir problemas de instalação SQLMap e Nikto
- Atualizar documentação em português e inglês
- Adicionar seção FUN_TOOLS no config.conf
- Melhorar tratamento de erros e robustez dos scripts"

# Verificar se há remote configurado
if ! git remote | grep -q origin; then
    echo "🔗 Adicionando remote origin..."
    git remote add origin https://github.com/xJCPMSx/linux-install-scripts.git
fi

# Push para GitHub
echo "🚀 Fazendo push para GitHub..."
git push -u origin main

echo "✅ Commit e push concluídos com sucesso!"
