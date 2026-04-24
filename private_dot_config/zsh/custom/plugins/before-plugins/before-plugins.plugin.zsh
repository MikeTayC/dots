# This is meant to be called first in the plugin line up in .zshrc - set any aliases required for the plugins here

# history-sync plugin directives 
# requires GNU sed - it keeps erroring on macos version
# brew install gnu-sed -> gives us gsed - we'll set the alias ehre so it'll work on
# zsh history sync plugin. Sething the sed to gsed here
alias sed='gsed'
