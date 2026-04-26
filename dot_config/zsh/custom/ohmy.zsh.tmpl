alias vzsh='vim ~/.zshrc'
alias czsh='cat ~/.zshrc'
alias ohmy="cd $ZSH_CUSTOM"
alias cgit="cat $ZSH_CUSTOM/git.zsh"

{{- if eq .zsh.ZSH_PLUGIN_MGR "ohmyzsh" }}
alias vohmy="vim $ZSH/oh-my-zsh.sh"
alias cohmy="cat $ZSH/oh-my-zsh.sh"
# Re source Zsh
alias zsrc='omz reload'
{{- else }}
alias zsrc="source $HOME/.zshrc"
{{- end }}

alias cleanzsrc="rm $ZSH_COMPDUMP && zsrc"

# find where an alias is defined - for functions use whence 'whence -v whencealias'
function whencealias(){
  if ! [ -z $1 ]; then
    PS4='+%x:%I>' zsh -i -x -c '' |& grep -w $1
 fi
}

alias bench='/usr/bin/time zsh -i -c exit'
function bigbench() {
  for i in $(seq 1 10); do /usr/bin/time /bin/zsh -i -c exit; done;
}

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


# open vscode
funciton vs () {
  open -na "Visual Studio Code.app" --args "$(pwd)/$1";
}
