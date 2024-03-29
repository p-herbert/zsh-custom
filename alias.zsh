# Aliases
alias so='source $HOME/.zshrc'
alias link='ln -s'
alias total='du -sh'
alias size='du -h'
alias di='diff -arq'
alias v='vim'
alias nv='nvim'
alias key=ssh-keygen -l -E md5 -f
alias ts='date +'%Y%m%d%H%M%S''
alias proxy='ssh -D 1337 -f -C -q -N'

# Load AWS
source $ZSH_CUSTOM/plugins/aws.zsh;

# Load NPM
source $ZSH_CUSTOM/plugins/npm.zsh

# Load Kubernetes
source $ZSH_CUSTOM/plugins/kubernetes.zsh

# Load Yubikey
source $ZSH_CUSTOM/plugins/yubikey.zsh

# Load Fzf
source $ZSH_CUSTOM/plugins/fzf.zsh

# Load .env
[ -f $ZSH_CUSTOM/.env ] && source $ZSH_CUSTOM/.env

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
