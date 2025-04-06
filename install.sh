#!/bin/bash

echo "🚀 Iniciando instalação do WhatsApp Backend..."

apt update && apt install -y curl unzip git

if ! command -v node &> /dev/null
then
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  apt install -y nodejs
fi

node -v
npm -v

mkdir -p /opt/whatsapp-backend
cd /opt/whatsapp-backend

echo "⚠️ Baixe o ZIP no seu computador e envie para /opt/whatsapp-backend via FileZilla ou painel da Hostinger"
echo "   Link do ZIP: https://sandbox.openai.com/mnt/data/whatsapp-backend-hostinger.zip"

read -p "Aperte ENTER após fazer o upload do ZIP..."

unzip -o whatsapp-backend-hostinger.zip
rm whatsapp-backend-hostinger.zip

npm install

npm install -g pm2
pm2 start index.js --name whatsapp-backend
pm2 save
pm2 startup

echo "✅ Backend rodando! Acesse em http://SEU-IP-OU-DOMINIO:3000"
