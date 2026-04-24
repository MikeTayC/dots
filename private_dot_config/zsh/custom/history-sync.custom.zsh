# history-sync plugin requires GNU sed - it keeps erroring on macos version 
# brew install gnu-sed -> gives us gsed - we'll set the alias ehre so it'll work on 
# zsh history sync plugin - SEE  custom/plugins/before-plugins

# your zsh_history file location
ZSH_HISTORY_FILE="${HOME}/.zsh_history"
# your git project for housing your zsh_history file
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_backups/drunk-zsh-history"
# your encrypted zsh_history file location
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/zsh_history"
# your default message when pushing to $ZSH_HISTORY_PROJ
GIT_COMMIT_MSG="latest $(date)"
