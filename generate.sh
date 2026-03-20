#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$ROOT_DIR"

rm -rf generated
mkdir -p generated/python generated/typescript

datamodel-codegen --input api.yaml --input-file-type openapi --output models.py
npx openapi-typescript api.yaml -o generated/typescript/types.ts
