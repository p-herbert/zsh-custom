# Aliases
alias so='source ~/.zshrc'
alias link='ln -s'
alias total='du -sh'
alias size='du -h'
alias di='diff -arq'

# Load AWS
source $ZSH_CUSTOM/plugins/aws.zsh;

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

