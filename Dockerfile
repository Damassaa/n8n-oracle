FROM n8nio/n8n:latest

USER root

# Instalar dependências do Oracle
RUN apt-get update && apt-get install -y \
    libaio1 \
    && rm -rf /var/lib/apt/lists/*

# Instalar o plugin Oracle
RUN npm install -g n8n-nodes-oracle-database-parameterization

# Configurar o plugin como variável de ambiente
ENV N8N_CUSTOM_EXTENSIONS="/usr/local/lib/node_modules/n8n-nodes-oracle-database-parameterization"

USER node

EXPOSE 5678

CMD ["n8n"]
