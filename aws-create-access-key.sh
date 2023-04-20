#!/bin/bash

if [ -z "$1" ]; then
    echo 'Usage: ./aws-create-access-key.sh "<username>"'
    exit 1
fi

username=$1

echo "[~] Username: $username"

echo "[+] Creating access key..."
aws iam create-access-key --user-name "$username"
