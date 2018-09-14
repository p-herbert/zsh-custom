# Aliases
alias so='source ~/.zshrc'
alias link='ln -s'
alias total='du -sh'
alias size='du -h'
alias di='diff -arq'

# Process Status
pg() {
    ps aux | grep $1 | grep -v grep
}

lsn() {
    ls -la | awk '{if ($0~/[rwx]/) {fh="stat -f %A " $9; fh | getline k; close(fh); print k,$0;} else {print;}}'
}

# Highlight file
dog() {
    pygmentize -f terminal256 -O style=native -g $1 | nl -v 0
}

# Kill process
gkill() {
    pg $1 | awk '{print $2}' | xargs kill -9
}

hl() {
    highlight -O ansi $1 | nl -v 0
}

