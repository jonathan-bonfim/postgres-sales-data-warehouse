#!/usr/bin/env bash
#
# Executa todos os scripts SQL, em ordem, dentro do container PostgreSQL.
#
# Pré-requisitos:
#   - Container no ar:  docker compose up -d
#   - Variáveis carregadas a partir do .env (ou os defaults abaixo)
#
# Observação: os scripts atuais não são totalmente idempotentes. Para reexecutar
# do zero, recrie o ambiente com:  docker compose down -v && docker compose up -d
#
set -euo pipefail

# Carrega variáveis do .env, se existir
if [ -f .env ]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

CONTAINER="${CONTAINER:-dsadw}"
DB_USER="${POSTGRES_USER:-dsaadmin}"
DB_NAME="${POSTGRES_DB:-dsadb}"

for f in sql/0*.sql; do
  echo "==> Executando ${f}"
  docker exec -i "${CONTAINER}" psql -v ON_ERROR_STOP=1 -U "${DB_USER}" -d "${DB_NAME}" < "${f}"
done

echo "==> Pipeline concluído com sucesso."
