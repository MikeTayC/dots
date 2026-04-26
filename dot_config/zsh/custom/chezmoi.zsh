alias che='chezmoi'
alias checd='cd ~/.local/share/chezmoi/'
alias chesrc='chezmoi source-path'
alias checonfig='cd ~/.config/chezmoi'

vim() {
  if [ $# -eq 0 ]; then
    command vim
    return
  fi

  local file="$1"

  # normalize path (important)
  file="$(realpath "$file" 2>/dev/null || echo "$file")"

  if chezmoi source-path "$file" >/dev/null 2>&1; then
    chezmoi edit --apply "$file"
  else
    command vim "$@"
  fi
}

alias vvim='command vim'
