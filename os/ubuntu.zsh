# Simulate OSX's pbcopy and pbpaste
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Simulate OSX's open
alias open='xdg-open'

# Replace
replace() {
    ack -l $1 | xargs sed -i "s/$1/$2/g"
}

# chmod value
alias gstat="stat -c %a"
