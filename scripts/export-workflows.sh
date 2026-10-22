#!/usr/bin/env bash
# Export every workflow of the running n8n container as separate JSON files into ./workflows
# (workflows only: credentials are never exported).
set -euo pipefail
cd "$(dirname "$0")/.."
docker compose exec -T n8n n8n export:workflow --all --separate --output=/tmp/export
mkdir -p workflows
docker compose cp n8n:/tmp/export/. workflows/
echo "Exported to ./workflows"
