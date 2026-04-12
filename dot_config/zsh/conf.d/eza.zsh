####
# customizations for colorful ls and and file type icons and such
# Requires:
# 
# `brew install coreutils eza`
# 
#  dir themes at ~/.config/dir_colors;
#  eza themese at ~/.config/eza
####

##
# Requires: `brew install eza`;
# Using a custom theme for eza
# Use https://github.com/eza-community/eza-themes for more theme options or customize directly;
# optional step: `git clone https://github.com/eza-community/eza-themes.git ~/.config/eza/.eza-themes/`
#
# See $HOME/.config/eza/theme.yaml for current theme; to change to new theme:
# > `cp ~/.eza-themes/themes/<your-theme>.yaml ~/.config/eza/theme.yaml`
#
# Must set the EZA_CONFIG_DIR and EZA_COLORS environment variables for change to take effect
# Current theme: tokyonight
##
export EZA_CONFIG_DIR="$HOME/.config/eza"
# gdircolors ZSH Coloring Magic
# ggamel (http://github.com/ggamel)
#
# This file should cause ZSH to load
# Solarized Dark into your terminal
# session.


##
# Remember: You need to have coreutils installed
# in order to use 'gls'. Assuming you have homebrew
# installed, run the following to get the party started:
# ( 'brew install coreutils' )
#
# Alias dircolors to gdircolors
#
export DIR_COLOR_CONFIG="$HOME/.config/dir_colors"
export DIR_COLOR_THEME="dircolors.trapdoor"
alias dircolors="gdircolors"
alias dirthemes="lt $DIR_COLOR_CONFIG"
alias lta='lt --all'

# We need to run this command to ensure
# ZSH and GNU dircolors ('gdircolors' cmd)
# properly load the Solarized GNU ls ('gls' cmd) color
# database file. The color scheme is stored in a database
# file readable by GNU dircolors.
#
# Credit for the Solarized Dark color database goes to
# seebi: https://github.com/seebi/dircolors-solarized
#
# This step is necessary because Solarized for Terminal or iTerm2
# is fantastic, but both 'ls' and 'gls' produce horrible shades
# of grey, instead of nice colors.
# By loading the database file, we have an even
# better terminal experience.
# to add more themes  add db files to ~/.dir_colors directory
# currently supported ls/directory themes: 
# dircolors.256dark
# dircolors.256dark.no-bold
# dircolors.ansi-dark
# dircolors.ansi-light
# dircolors.ansi-universal
eval `dircolors $DIR_COLOR_CONFIG/$DIR_COLOR_THEME`
