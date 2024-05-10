#!/bin/bash
set -e

# Remove um arquivo de servidor específico do Rails que por vezes causa problemas no contêiner
rm -f /myapp/tmp/pids/server.pid

# Executa o comando passado para o docker (CMD)
exec "$@"