#!/bin/bash -ue

secret=$1

if [[ -z "${secret}" ]]; then echo "please specify secret"; exit 1; fi

touch secret/${secret}.in.txt

touch secret/${secret}.out.txt
