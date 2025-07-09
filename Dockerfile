FROM n8nio/n8n:latest

USER root

# Instalar dependências do Oracle (Alpine Linux)
RUN apk add --no-cache libaio

# Instalar o plugin Oracle
RUN npm install -g n8n-nodes-oracle-database-parameterization

# Configurar o plugin como variável de ambiente
ENV N8N_CUSTOM_EXTENSIONS="/usr/local/lib/node_modules/n8n-nodes-oracle-database-parameterization"

USER node

EXPOSE 5678

# Usar o comando padrão da imagem original (sem alterar)
