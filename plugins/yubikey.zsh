###########
# YubiKey #
###########
function mfa() {
  token=$(ykman oath code -s $1)
  echo "SUCCESS"
  echo $token | pbcopy
}
}
