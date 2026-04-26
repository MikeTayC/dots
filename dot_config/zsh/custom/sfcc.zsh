# -------------------------
# sfcc-ci alias / functions
# -------------------------
alias sfc="cd ~/Volumes/Tools/sfcc-ci"
alias sfci="sfcc-ci"
alias sfcc="sfcc-ci"
function sfcauth () { sfc && sfcc-ci auth:login; cd -1;}

function sfchelp () { sfc && sfcc-ci --help; cd -1;}

function sfclist () { sfc && sfcc-ci sandbox:list; cd -1; }

function sfccreate () { sfc & sfcc-ci sandbox:create -r "$1" -t 0; cd -1;}

function sfcget () { sfc && sfcc-ci sandbox:get --sandbox "$1";  cd -1;}

function sfcrestart () { sfc && sfcc-ci sandbox:restart --sandbox "$1";  cd -1;}

function sfcstart () { sfc && sfcc-ci sandbox:start --sandbox "$1";  cd -1;}

function sfcstop () { sfc && sfcc-ci sandbox:stop --sandbox "$1";  cd -1;}

function sfcdelete () { sfc && sfcc-ci sandbox:delete --sandbox "$1";  cd -1;}

function sfchardreset () { sfc && sfcc-ci sandbox:reset --sandbox "$1";  cd -1;}

function sfccodev () { sfc && sfcc-ci code:list --instance "$1";  cd -1;}

# Tooling Aliases
alias nrw='npm run watch'
alias nr='npm run'
alias nrlj='npm run lint:js'
alias nrls='npm run lint:css'
alias nrl='npm run lint'

alias prw='pnpm run watch'
alias pr='pnpm run'
alias prlj='pnpm run lint:js'
alias prls='pnpm run lint:css'
alias prl='pnpm run lint'
