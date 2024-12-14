#!/bin/bash -ue

key=age1tvx0ufxk5vkucmlyzha3xvkw4u29nl8x5u7m43qqv75num7tda2qzzxtt4

secret=$1

if [[ ! -e secret/${secret}.in.txt ]]; then echo "secret/${secret}.in.txt not exists"; exit 1; fi

sops encrypt \
	 --age ${key} \
	 secret/${secret}.in.txt > secret/${secret}.json.tmp

cat secret/${secret}.json.tmp | jq . > secret/${secret}.enc.json

rm secret/${secret}.json.tmp
