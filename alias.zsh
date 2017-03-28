# Use Homebrew vim
alias vim='/usr/local/bin/vim'

# Process Status
myFunc() {ps aux | grep $1 | grep -v grep;}
alias pg=myFunc

alias so='source ~/.zshrc'

# Highlight file
pyg() {
    pygmentize -f terminal256 -O style=native -g $1 | perl -e 'print ++$i." $_" for <>'
}
alias dog=pyg

hilight() {highlight -O ansi $1 | perl -e 'print ++$i." $_" for <>'}
alias hl=hilight
