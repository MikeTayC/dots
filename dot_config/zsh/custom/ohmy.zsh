###############
# oh my zsh - customizations 
###############
# ----------------------
# CD Aliases
# ----------------------
alias tool="cd ~/Volumes/Tools"
alias tools="tool"

SITES='~/Volumes/Sites'
alias sites="cd $SITES"
alias site="sites"
alias lc="cd $SITES/lc"
alias web="cd $SITES/web"
alias lc2="cd $SITES/lc2"
alias lc3="cd $SITES/lc3"
alias blm="cd $SITES/blm"
alias train="cd $SITES/devops-lc"

#######
# aliases for oh my zsh customizations
######
alias vzsh='vim ~/.zshrc'
alias czsh='cat ~/.zshrc'
alias ohmy="cd $ZSH_CUSTOM"
alias vohmy="vim $ZSH/oh-my-zsh.sh"
alias cohmy="cat $ZSH/oh-my-zsh.sh"
alias cgit="cat $ZSH/custom/git.zsh"
# Re source Zsh
alias zsrc='omz reload'
alias cleanzsrc="rm $ZSH_COMPDUMP && zsrc"

# BAiCi devops helpers
alias ckube="cat $ZSH/plugins/kubectl/kubectl.plugin.zsh"

#######
# methods for searching for aliases/commands
#######

# find where an alias is defined - for functions use whence 'whence -v whencealias'
function whencealias(){
  if ! [ -z $1 ]; then
    PS4='+%x:%I>' zsh -i -x -c '' |& grep -w $1
 fi
}

# grep search aliases based on their commands


# alias to sort the folder/files in the current directory by date
alias las='la -tU'

#alias for benchmarking zsh load times
alias bench='/usr/bin/time zsh -i -c exit'
function bigbench() {
  for i in $(seq 1 10); do /usr/bin/time /bin/zsh -i -c exit; done;
}
alias zio='zsh -xv'

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

zprofiler() {
  time ZSH_DEBUGRC=1 zsh -i -c exit
}

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# ----------------------
# IDE functions
# ----------------------
funciton vs () {
  open -na "Visual Studio Code.app" --args "$(pwd)/$1";
}

function zshdumptest () {
  setopt LOCAL_OPTIONS extendedglob
  for dump in ~/.cache/zsh/zcompdump/.zcomdump*(N.ms+    10); do
    echo "reg compinit"
  done
  echo "compinit -C"
}
