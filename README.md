# CloudPersist

A collection of simple scripts to achieve persistence quick in cloud environments without generating too much noise.

# Usage

## AWS

To use the AWS scripts you must have [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and authenticated (with `aws configure` for instance).

### aws-create-iam-user

Creates an IAM user with a login profile with the specified IAM policy.
This script will try to use the `AdministratorAccess` managed IAM policy by default, but you can also specify a custom policy ARN.

Examples:
```bash
$ ./aws-create-iam-user.sh "myuser" "mypassword" "arn:aws:iam::aws:policy/AmazonS3FullAccess"
$ ./aws-create-iam-user.sh "myuser" "mypassword" # Uses AdministratorAccess
```

### aws-create-access-key

Creates an access key for the specified IAM user.

Example:
```
$ ./aws-create-access-key myiamuser
```

## GCP

To use the GCP scripts you must have [GCP CLI](https://cloud.google.com/sdk/docs/install?hl=pt-br) installed and authenticated (with `gcloud init` or `gcloud auth login` for instance).

### gcp-invite-account

Invites a Google account to an existing GCP project using the specified role.

If a role is not specified, it'll try to use `roles/editor` by default.

Examples:
```bash
$ ./gcp-invite-account.sh my-project-123 "myemail@gmail.com" "roles/viewer"
$ ./gcp-invite-account.sh my-project-123 "myemail@gmail.com" # Uses roles/editor
```

## Azure

To use the Azure scripts you must have [Azure CLI](https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli) installed and authenticated (with `az login` for instance).

### az-create-aad-user

Creates a new user in Azure Active Directory using the specified role.

If a role is not specified, it'll try to use the `Owner` role for the current subscription by default.

Examples:
```bash
$ ./az-create-aad-user.sh "myemail@gmail.com" "mypassword" "myname" "Reader"
$ ./az-create-aad-user.sh "myemail@gmail.com" "mypassword" "myname" # Uses the "Owner" role by default
```

### az-vm-exec-runcommand

Runs the specified Shell (unix)/PowerShell (windows) command on a list of VMs. Can be used to easily backdoor multiple VMs at once.

To execute this script you must first obtain the resource IDs for your target VMs (with `az vm list` for instance). Then specify them *separated with spaces and enclosed in quotes* in the 1st argument of the script:

```bash
$ ./az-vm-exec-runcommand.sh "<resource IDs>" "<command to run>" # For Shellscript
$ ./az-vm-exec-runcommand.sh "<resource IDs>" "<command to run>" windows # For PowerShell
```

The command to run can also be stored in a file and specified with an `@`. Example:

```bash
$ ./az-vm-exec-runcommand.sh "/subscriptions/<SUBSCRIPTIONID1>/resourceGroups/<RESOURCEGROUP1>/providers/Microsoft.Compute/virtualMachines/<VMNAME1> /subscriptions/<SUBSCRIPTIONID2>/resourceGroups/<RESOURCEGROUP2>/providers/Microsoft.Compute/virtualMachines/<VMNAME2>" @persistencescript.sh
```

# TODO
* Add more options to existing scripts
* Make powershell version of scripts
* Test scripts more to make sure they're working properly
* Idea - Execute persistence script in existing AWS EC2 / Azure VMs / GCP Compute Instances (similarly to T1525 but on running instances)
* Idea - Provisioning of malicious event-triggered AWS Lambda/GCP Cloud Function/Azure Function (T1546)
* Idea - Make scripts for persistence with cross-account sharing of resources
* Idea - Long-term persistence by adding custom identity providers / custom signup flows (T1556)

# License
The MIT License (MIT)

Copyright (c) 2023 Artur Henrique Marzano Gonzaga

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
