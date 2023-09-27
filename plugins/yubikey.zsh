###########
# YubiKey #
###########
function mfa() {
  token=$(ykman oath code -s $1)
  [[ -v ${token} ]] && echo ${token} | pbcopy && echo "SUCCESS"
}

function mfa_token() {
  ykman oath accounts code -s $1
}

function mfa_console() {
  token=$(ykman oath accounts code -s $AWS_MFA_ARN)
  echo "SUCCESS"
  echo $token | pbcopy
}

function prod_vpn() {
  token=$(ykman oath accounts code -s $OPENVPN_PROD_KEY_ID)
  echo "SUCCESS"
  echo $token | pbcopy
}

function dev_vpn() {
  token=$(ykman oath accounts code -s $OPENVPN_DEV_KEY_ID)
  echo "SUCCESS"
  echo $token | pbcopy
}

function stg_vpn() {
  token=$(ykman oath accounts code -s $OPENVPN_STG_KEY_ID)
  echo "SUCCESS"
  echo $token | pbcopy
}
