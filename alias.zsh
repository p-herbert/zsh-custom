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

# Kill process
mykill() {
    pg $1 | awk '{print $2}' | xargs kill -9
}
alias gkill=mykill

hilight() {highlight -O ansi $1 | awk '{printf "%d\t%s\n", NR, $0}'}
alias hl=hilight

dev-search() {
    find . \( -iname "*.js" -o -iname "*.jsx" \) -type f ! -path "./*/\.meteor/*" ! -path "./*/node_modules/*" | xargs ack $1
}
alias gfind=dev-search

# Start various Sunsama servers easily.
export DEV_APP=~/Documents/Development/sunsama;

function db {
    mongod --port 3001 &;
}

function sunsama-app {
    cd $DEV_APP/meteor/sunsama-app;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor;
}
function sunsama-notifs {
    cd $DEV_APP/meteor/sunsama-notifications;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor --port 3002;
}
function sunsama-worker {
    cd $DEV_APP/meteor/sunsama-worker;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor --port 3003;
}
function sunsama-realcandy {
    export ENV=DEV;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    export PORT=8888;
    export TZ=UTC;
    cd $DEV_APP; . venv-realcandy/bin/activate;
    cd realcandy; python -m web.webapp;
}
