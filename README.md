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
$ ./aws-create-iam-user.sh "myuser" "mycomplicatedpassword" "arn:aws:iam::aws:policy/AmazonS3FullAccess"
$ ./aws-create-iam-user.sh "myuser" "mycomplicatedpassword" # Uses AdministratorAccess
```

### aws-create-access-key

Creates an access key for the specified IAM user.

Example:
```
$ ./aws-create-access-key myiamuser
```

## GCP

### gcp-invite-account

Invites a Google account to an existing GCP project using the specified role.

If a role is not specified, it'll try to use `roles/editor` by default.

Examples:
```bash
$ ./gcp-invite-account.sh my-project-123 "myemail@gmail.com" "roles/viewer"
$ ./gcp-invite-account.sh my-project-123 "myemail@gmail.com" # Uses roles/editor
```

## Azure
TODO

# TODO
* Make scripts for persistence with cross-account sharing of resources
* Add more options to existing scripts
* Make powershell version of scripts
* Test scripts to make sure it's working properly

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
