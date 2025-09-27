#!/bin/bash

# Script para fazer upload do projeto para o GitHub
# Execute este script após criar o repositório no GitHub

echo "🚀 Upload para GitHub - Script de Instalação openSUSE"
echo "=================================================="
echo ""

# Verificar se estamos em um repositório Git
if [ ! -d ".git" ]; then
    echo "❌ Erro: Não estamos em um repositório Git"
    echo "   Execute: git init primeiro"
    exit 1
fi

# Verificar se há commits
if [ -z "$(git log --oneline 2>/dev/null)" ]; then
    echo "❌ Erro: Nenhum commit encontrado"
    echo "   Execute: git add . && git commit -m 'Commit inicial'"
    exit 1
fi

echo "✅ Repositório Git verificado"
echo ""

# Solicitar URL do repositório GitHub
echo "📝 Digite a URL do seu repositório GitHub:"
echo "   Exemplo: https://github.com/seu-usuario/opensuse-install-script.git"
read -p "URL: " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ URL não fornecida"
    exit 1
fi

echo ""
echo "🔧 Configurando repositório..."

# Adicionar remote origin
git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"

# Renomear branch para main
git branch -M main

echo "✅ Configuração concluída"
echo ""

echo "📤 Fazendo upload para o GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Upload realizado com sucesso!"
    echo "🔗 Seu repositório está disponível em:"
    echo "   $(echo $REPO_URL | sed 's/\.git$//')"
    echo ""
    echo "📋 Próximos passos:"
    echo "   1. Acesse seu repositório no GitHub"
    echo "   2. Adicione uma descrição e tags"
    echo "   3. Configure as configurações do repositório"
    echo "   4. Compartilhe o link com outros usuários"
else
    echo ""
    echo "❌ Erro no upload"
    echo "   Verifique sua conexão e credenciais do GitHub"
    echo "   Execute: git remote -v para verificar a URL"
fi
