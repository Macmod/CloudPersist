#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo 'Usage: ./az-create-aad-user.sh "<email>" "<password>" ["<display name>" "<role to attach>" "<role scope>"]'
    exit 1
fi

email=$1
password=$2
if [ -z "$3" ]; then
    displayname="$email"
else
    displayname=$3
fi

if [ -z "$4" ]; then
    role="Owner"
else
    role=$4
fi

subscription=$(az account list | grep '"id"' | awk '{print $2}' | tr -d '",\n')
echo "[~] Detected subscription: $subscription"

if [ -z "$5" ]; then
    role_scope="/subscriptions/$subscription"
else
    role_scope=$5
fi

echo "[~] UserPrincipalName: $email"
echo "[~] DisplayName: $displayname"
echo "[~] Password: $password"
echo "[~] User Role: $role"
echo "[~] User Role Scope: $role_scope"

echo "[+] Creating user..."
az ad user create --user-principal-name "$email" --display-name "$displayname" --password "$password" --force-change-password-next-sign-in false

echo "[+] Assigning role to user..."
az role assignment create --role "$role" --assignee "$email" --scope "$role_scope"
