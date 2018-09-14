# Process Status
pg() {
    ps aux | grep $1 | grep -v grep
}

alias so='source ~/.zshrc'

lsn() {
    ls -la | awk '{if ($0~/[rwx]/) {fh="stat -f %A " $9; fh | getline k; close(fh); print k,$0;} else {print;}}'
}

alias link='ln -s'
alias total='du -sh'
alias size='du -h'
alias di='diff -arq'

# Highlight file
dog() {
    pygmentize -f terminal256 -O style=native -g $1 | awk '{printf "%d\t%s\n", NR, $0}'
}

# Kill process
gfill() {
    pg $1 | awk '{print $2}' | xargs kill -9
}

hl() {
    highlight -O ansi $1 | awk '{printf "%d\t%s\n", NR, $0}'
}

