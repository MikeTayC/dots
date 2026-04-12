alias che='chezmoi'
alias checd='cd ~/.local/share/chezmoi/'
alias chesrc='chezmoi source-path'
alias checonfig='cd ~/.config/chezmoi'

# credit: https://github.com/twpayne/chezmoi/discussions/1598
# "vim FILE_NAME" automatically runs "chezmoi edit FILE_NAME" command if the file is under management by chemoi.
# otherwise just give the all arguments to neovim
# function vim() {
#   if [ $# -eq 0 ]; then
#     vim
#     return
#   fi

#   # Added "--hardlink=false" option to get neovim undo available.
#   chezmoi verify $1 > /dev/null 2>&1\
#     && chezmoi edit --watch --hardlink=false $1\
#     || vim $@
# }
