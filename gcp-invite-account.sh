#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo 'Usage: ./gcp-invite-account.sh "<project>" "<email>" [<role ID>]'
    exit 1
fi

project_id=$1
email=$2

if [ -z "$3" ]; then
    role_id="roles/editor"
else
    role_id=$3
fi

gcloud projects add-iam-policy-binding $project_id --member=user:$email --role=$role_id
