#######
# AWS #
#######
function aws_login() {
  profile=${1?'ERROR: Expected a profile'}
  # aws_mfa_arn=${AWS_MFA_ARN?'ERROR: AWS_MFA_ARN is not set'}
  aws_mfa_arn=$(aws configure --profile "$profile" get mfa_serial)
  code=$(mfa_token $aws_mfa_arn)
  aws-get-session-token.sh $profile $code && echo "SUCCESS"
}
