#!/bin/bash

# URL base da sua API
BASE_URL="http://localhost:5000"

# Array contendo todas as rotas que você deseja testar
ROUTES=(
    "/"
    "/ping"
    "/test"
)

# Loop através de todas as rotas e fazer solicitações HTTP
for route in "${ROUTES[@]}"
do
    # Construir a URL completa da rota
    URL="$BASE_URL$route"

    # Fazer a solicitação HTTP usando curl e armazenar o status da resposta
    status=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    # Verificar se o status da resposta é 200 OK
    if [ "$status" -eq 200 ]; then
        echo "Rota $route está respondendo com status 200 OK."
    else
        echo "AVISO: Rota $route retornou um status diferente de 200 OK. Status: $status"
    fi
done