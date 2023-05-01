#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
    echo 'Usage: ./gcp-gce-exec-ssh.sh "<instance name>" "<command to run>"'
    exit 1
fi

vm_ids=$1
runcmd=$2

project_id=$(gcloud config list --format 'value(core.project)')

echo "[~] Provided command to run:"
echo "'$runcmd'"
echo "[~] Project ID: $project_id"

gcloud compute ssh $vm_ids --project "$project_id" --command "$runcmd"
