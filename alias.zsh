# Aliases
alias so='source $HOME/.zshrc'
alias link='ln -s'
alias total='du -sh'
alias size='du -h'
alias di='diff -arq'
alias v='vim'
alias nv='nvim'

# Load AWS
source $ZSH_CUSTOM/plugins/aws.zsh;

# Load Travis-CI
source $ZSH_CUSTOM/plugins/travis-ci.zsh

# Load NPM
source $ZSH_CUSTOM/plugins/npm.zsh

# Load Kubernetes
source $ZSH_CUSTOM/plugins/kubernetes.zsh

# Load OSX configurations
[ $(uname -s) = 'Darwin' ] && source $ZSH_CUSTOM/os/osx.zsh

# Load Ubuntu configurations
[ $(uname -s) = 'Linux' ] && source $ZSH_CUSTOM/os/ubuntu.zsh

# Process status
pg() {
    ps aux | grep $1 | grep -v grep
}

# Kill process
gkill() {
    pg $1 | awk '{print $2}' | xargs kill -9
}

# Highlight file
dog() {
    pygmentize -f terminal256 -O style=native -g $1 | nl -v 0
}

# Highlight file
hl() {
    highlight -O ansi $1 | nl -v 0
}
