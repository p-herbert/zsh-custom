# Use Homebrew vim
alias vim='/usr/local/bin/vim'

# psql
alias awsdb='psql --host=truncated-avocados-db.ccmennnvhu6h.us-west-2.rds.amazonaws.com --port=5432 --username=truncados --password --dbname=blog_graph'

# Process Status
myFunc() {ps aux | grep $1 | grep -v grep;}
alias pg=myFunc

alias so='source ~/.zshrc'
