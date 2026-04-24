# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=("fzf-history-widget")
# Disabling automatic widget re-binding
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

# change autocomplete entry color to be darker
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=103'

# https://github.com/marlonrichert/zsh-autocomplete?tab=readme-ov-file#make-enter-submit-the-command-line-straight-from-the-menu
# Enter auto submits the command from autocomplete
#bindkey -M menuselect '\t' .accept-line
#bindkey -M menuselect "^[OC" accept-search
#bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

#bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
