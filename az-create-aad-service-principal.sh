#!/bin/bash

# Use "az account show" to list available subscriptions
# Set <scope> explicitly to specify a specific subscription; otherwise
# the script is going to use the first result in "az account show"

if [ -z "$1" ]; then
    echo 'Usage: ./az-create-aad-service-principal.sh "<username>" ["<role to attach>" "<scope>"]'
    exit 1
fi

username=$1

if [ -z "$2" ]; then
    role="Owner"
else
    role=$2
fi

if [ -z "$3" ]; then
    subid=$(az account show | grep '"id"' | head -n1 | awk '{print $2}' | tr -d '"' | tr -d ',')
    scopes="/subscriptions/$subid"
else
    scopes=$2
fi

az ad sp create-for-rbac --name "$username" --role "$role" --scopes "$scopes"

# To assign other roles to your SP, get the object ID of your service principal and then run:
# $ az role assignment create --assignee <Target object ID> --role "<Role name or ID" --scope "/subscriptions/<subscription ID>"
# To find other roles use "az role definitions list"

# Note that it's believed that organizational roles can't be assigned via Azure CLI,
# but they can by using the MSOL Powershell "Add-MsolRoleMember" cmdlet or via the UI.
