#!/bin/bash -ue

name=$1

if [[ -z "${name}" ]]; then echo "please specify secret name"; exit 1; fi

touch secret/${name}.in.txt

touch secret/${name}.out.txt
