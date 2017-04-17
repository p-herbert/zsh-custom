# Use Homebrew vim
alias vim='/usr/local/bin/vim'

# Process Status
myFunc() {ps aux | grep $1 | grep -v grep;}
alias pg=myFunc

alias so='source ~/.zshrc'

# Highlight file
pyg() {
    pygmentize -f terminal256 -O style=native -g $1 | awk '{printf "%d\t%s\n", NR, $0}'
}
alias dog=pyg

hilight() {highlight -O ansi $1 | awk '{printf "%d\t%s\n", NR, $0}'}
alias hl=hilight

# Start various Sunsama servers easily.
function sunsama-app {
    cd ~/sunsama/meteor/sunsama-app; meteor npm install; export ENV=dev; export MONGO_URL=mongodb://localhost:27017/meteor; export ALT_MONGO_URL=mongodb://localhost:27017/alt_data; meteor; export TZ=UTC;
}
function sunsama-notifs {
    cd ~/sunsama/meteor/sunsama-notifications; meteor npm install; export ENV=dev; export MONGO_URL=mongodb://localhost:27017/meteor; export ALT_MONGO_URL=mongodb://localhost:27017/alt_data; meteor --port 3002; export TZ=UTC;
}
function sunsama-worker {
    cd ~/sunsama/meteor/sunsama-worker; meteor npm install; export ENV=dev; export MONGO_URL=mongodb://localhost:27017/meteor; export ALT_MONGO_URL=mongodb://localhost:27017/alt_data; meteor --port 3003; export TZ=UTC;
}
function sunsama-realcandy {
    export ENV=DEV; export MONGO_URL=mongodb://localhost:27017/meteor; export ALT_MONGO_URL=mongodb://localhost:27017/alt_data; export PORT=8888; export TZ=UTC;
    cd ~/sunsama; . venv-realcandy/bin/activate; cd realcandy; python -m web.webapp;
}
