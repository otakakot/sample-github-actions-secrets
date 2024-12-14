#!/bin/bash -ue

secret=$1

source ./.env

export SOPS_AGE_KEY="${SOPS_AGE_KEY}"

if [[ ! -e secret/${secret}.enc.json ]]; then echo "secret/${secret}.enc.json not exists"; exit 1; fi

sops decrypt secret/${secret}.enc.json > secret/${secret}.tmp.json

touch secret/${secret}.in.txt

cat secret/${secret}.tmp.json | jq .data | tr -d '"' > secret/${secret}.out.txt

rm secret/${secret}.tmp.json

SECRET=$(echo ${secret} | awk '{print toupper($0)}')

gh secret set ${SECRET} --body "$(cat secret/${secret}.out.txt)"
