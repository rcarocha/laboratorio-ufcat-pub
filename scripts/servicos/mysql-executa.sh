#!/bin/bash

set -e

MYSQL_ROOT_PASSWORD="1dro-keth-ynce"
MYSQL_PORT="3307"
CONTAINER_NAME="mysql-server"
DATA_DIR="$HOME/mysql-data"
NETWORK_NAME="mysql-net"
STATIC_IP="172.16.41.74"
CPU_LIMIT="0.5"
MEMORY_LIMIT="512m"

echo "Garantindo que rede Docker '$NETWORK_NAME' existe..."
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || \
    docker network create --subnet=172.16.41.0/24 $NETWORK_NAME

echo "Removendo container antigo se existir..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "Iniciando container MySQL..."
docker run -d \
  --name $CONTAINER_NAME \
  --network $NETWORK_NAME \
  --ip $STATIC_IP \
  -p $MYSQL_PORT:3306 \
  -e MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD" \
  -v $DATA_DIR:/var/lib/mysql \
  --cpus=$CPU_LIMIT \
  --memory=$MEMORY_LIMIT \
  --restart unless-stopped \
  mysql:8.0 \
  --default-authentication-plugin=mysql_native_password

echo "Aguardando MySQL ficar pronto..."
# Correção aqui: removido o -h"localhost" para o ping usar o socket interno direto
until docker exec $CONTAINER_NAME mysqladmin ping -u root -p"$MYSQL_ROOT_PASSWORD" --silent; do
    echo "Ainda iniciando... aguardando 2 segundos."
    sleep 2
done

echo "MySQL rodando."
echo ""
echo "Dados do container:"
echo "  - IP fixo interno: $STATIC_IP"
echo "  - Porta externa (host): $MYSQL_PORT -> container:3306"
echo "  - Usuario root: root"
echo "  - Senha: $MYSQL_ROOT_PASSWORD"
echo "  - CPU limit: $CPU_LIMIT core(s)"
echo "  - RAM limit: $MEMORY_LIMIT"
echo "  - Dados persistentes em: $DATA_DIR"
echo ""
echo "Para conectar via DBeaver localmente (ou outro cliente):"
echo "   Host: $STATIC_IP"
echo "   Porta: 3306"
echo "   Usuario: root"
echo "   Senha: $MYSQL_ROOT_PASSWORD"

