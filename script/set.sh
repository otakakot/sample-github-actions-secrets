#!/bin/bash -ue

name=$1

source ./.env

export SOPS_AGE_KEY="${SOPS_AGE_KEY}"

if [[ ! -e secret/${name}.enc.json ]]; then echo "secret/${name}.enc.json not exists"; exit 1; fi

sops decrypt secret/${name}.enc.json > secret/${name}.tmp.json

touch secret/${name}.in.txt

cat secret/${name}.tmp.json | jq .data | tr -d '"' > secret/${name}.out.txt

rm secret/${name}.tmp.json

NAME=$(echo ${name} | awk '{print toupper($0)}')

gh secret set ${NAME} --body "$(cat secret/${name}.out.txt)"
