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
