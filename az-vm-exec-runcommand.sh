#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
    echo 'Usage: ./az-vm-exec-runcommand.sh "<resource IDs>" "<command to run>" ["<windows/unix>"]'
    exit 1
fi

vm_ids=$1
runcmd=$2

if [ -z "$3" ]; then
    platform="unix"
else
    platform=$3
fi

echo "[~] Provided command to run:"
echo "'$runcmd'"
echo "[~] Platform: $platform"

cmd_id="RunShellScript"
if [ $platform == "windows" ]; then
    cmd_id="RunPowerShellScript"
fi

az vm run-command invoke \
    --command-id "$cmd_id" \
    --ids $vm_ids \
    --scripts "$runcmd"
