###########
# YubiKey #
###########
function mfa() {
  token=$(ykman oath code -s $1)
  [[ -v ${token} ]] && echo ${token} | pbcopy && echo "SUCCESS"
}
