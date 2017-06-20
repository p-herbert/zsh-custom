# Use Homebrew vim
alias vim='/usr/local/bin/vim'

# Process Status
myFunc() {ps aux | grep $1 | grep -v grep;}
alias pg=myFunc

alias so='source ~/.zshrc'

lsn() { ls -la | awk '{if ($0~/[rwx]/) {fh="stat -f %A " $9; fh | getline k; close(fh); print k,$0;} else {print;}}'; }

alias link='ln -s'

# Highlight file
pyg() {
    pygmentize -f terminal256 -O style=native -g $1 | awk '{printf "%d\t%s\n", NR, $0}'
}
alias dog=pyg

# Kill process
mykill() {
    pg $1 | awk '{print $2}' | xargs kill -9
}
alias gkill=mykill

hilight() {highlight -O ansi $1 | awk '{printf "%d\t%s\n", NR, $0}'}
alias hl=hilight
