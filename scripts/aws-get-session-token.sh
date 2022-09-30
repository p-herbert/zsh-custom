#!/bin/bash
set -eu

profile="${1?'ERROR: Expected a profile'}"
token="${2?'ERROR: Expected a token'}"

function aws_configure_default_profile() {
  aws --profile default configure set aws_access_key_id "$1"
  aws --profile default configure set aws_secret_access_key "$2"
  aws --profile default configure set aws_session_token "$3"
}

aws_configure_default_profile "$( \
  aws sts get-session-token \
    --profile "$profile" \
    --serial-number "$(aws configure --profile "$profile" get mfa_serial)" \
    --duration-seconds "$(aws configure --profile "$profile" get duration_seconds)" \
    --token "$token" \
    --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
    --output text
)"
