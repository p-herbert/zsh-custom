# YubiKey #
#############
function mfa() {
  ykman oath code -s $1
}
