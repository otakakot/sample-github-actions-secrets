#!/bin/bash -ue

key=age15ejyvpj84w5f42t0v6wnlz86qtnyyrxqx0k9ghtlqr5tfs23tcnsjupyay

name=$1

if [[ ! -e secret/${name}.in.txt ]]; then echo "secret/${name}.in.txt not exists"; exit 1; fi

sops encrypt \
	 --age ${key} \
	 secret/${name}.in.txt > secret/${name}.json.tmp

cat secret/${name}.json.tmp | jq . > secret/${name}.enc.json

rm secret/${name}.json.tmp
