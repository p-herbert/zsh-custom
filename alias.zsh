# Use Homebrew vim
alias vim='/usr/local/bin/vim'

# Process Status
myFunc() {ps aux | grep $1 | grep -v grep;}
alias pg=myFunc

alias so='source ~/.zshrc'

lsn() { ls -la | awk '{if ($0~/[rwx]/) {fh="stat -f %A " $9; fh | getline k; close(fh); print k,$0;} else {print;}}'; }

gs() {
    printf '%-6s | %-6s | %s\n' 'Number' 'Status' 'Filename';
    git status -s | awk '{printf "%-6s | %-6s | %s\n", NR, $1, $2}';
}

replace() {
    # Check for STDIN
    if [ $# -ge 3 -a -f "$3" ];
    then
        sed -i '' "s/$1/$2/g" $3;
    else
        while read file
            do
                sed -i '' "s/$1/$2/g" $file;
            done
    fi
}

alias link='ln -s'
alias total='du -sh'
alias size='du -h'

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
    find . \( -iname "*.js" -o -iname "*.jsx" \) -type f ! -path ".*/\.meteor/*" ! -path ".*/node_modules/*" | xargs ack $@
}
alias gfind=dev-search

alias lg='lnav -p'
alias pt=papertrail
alias pt-app="pt --min-time '24 hour ago' --force-color -- -nginx -DEBUG sunsama-production | lnav -q"
alias pt-connector="pt --min-time '24 hour ago' --force-color -- -nginx -DEBUG sunsama-connector | lnav -q"
alias pt-worker="pt --min-time '24 hour ago' --force-color -- -nginx -DEBUG sunsama-worker | lnav -q"
alias pt-notifications="pt --min-time '24 hour ago' --force-color -- -nginx -DEBUG sunsama-notifications | lnav -q"
alias pt-recent="pt --min-time '10 minute ago' --force-color -- | tee /tmp/papertail.log | lnav -q"
alias pt-today="pt --min-time '24 hour ago' --force-color -- | tee /tmp/papertail.log | lnav -q"

follow() { papertrail -f --min-time '10 minute ago' -d 5 --force-color $* | lnav -q; }
alias pt-tail=follow

# Sunsama aliases
alias hooks='ngrok http -subdomain=sunsama 3002'
alias mtest='meteor test --driver-package practicalmeteor:mocha --port 3100 | lnav -q'

# Start various Sunsama servers easily.
export DEV_APP=~/Documents/Development/sunsama/meteor;

function db {
    #mongod --master --port 3001 &;
    mongod --oplogSize 8 --replSet meteor --port 3001 &;
}

function sunsama-app {
    cd $DEV_APP/sunsama-app;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    [[ -n $MONGO_URL ]] && unset MONGO_URL;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor | lnav -q;
}
function sunsama-notifs {
    cd $DEV_APP/sunsama-notifications;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor --port 3002 | lnav -q;
}
function sunsama-worker {
    cd $DEV_APP/sunsama-worker;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor --port 3003 | lnav -q;
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
function sunsama-connector {
    cd $DEV_APP/sunsama-connector;
    meteor npm install;
    export ENV=dev;
    export TZ=UTC;
    export MONGO_URL=mongodb://localhost:3001/meteor;
    export ALT_MONGO_URL=mongodb://localhost:3001/alt_data;
    meteor --port 3004 | lnav -q;
}
