#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo 'Usage: ./aws-create-iam-user.sh "<username>" "<password>" [<user policy ARN>]'
    exit 1
fi

username=$1
password=$2
if [ -z "$3" ]; then
    userpolicy="arn:aws:iam::aws:policy/AdministratorAccess"
else
    userpolicy=$3
fi

echo "[~] Username: $username"
echo "[~] Password: $password"
echo "[~] User Policy ARN: $userpolicy"

echo "[+] Creating user..."
user_arn=$(aws iam create-user --user-name "$username" --output text --query 'User.Arn')

echo "[+] Creating login profile..."
aws iam create-login-profile --user-name "$username" --password "$password" --password-reset-required

echo "[+] Attaching user policy..."
aws iam attach-user-policy --policy-arn "$userpolicy" --user-name "$username"
