zsh - new machine set up notes
homebrew

brew install:
chezmoi


mise
# temporary fix for installing node <14 on the new arm64 silicon chips with mise 
# https://mise.jdx.dev/tips-and-tricks.html#macos-rosetta
# https://github.com/jdx/mise/issues/2302
$  mise settings arch=x86_64


# replaces cat with formatted/colored version
bat 

# Replaces GNU/ls; Acitve theme is saved to chezmoi; Use https://github.com/eza-community/eza-themes for more theme options; Theme saved at location `export EZA_COLORS="$HOME/.config/eza/theme.yaml"`

eza

# needed for dircolors and ls among other things
coreutils 

# zsh plugin - history-sync requires GNU sed; before-plugins sed is replaced
gnu-sed

# using for terminal replacement for amphetabmine
countdown



other:
sfcc-ci



---------------------------

the ultimate vimrc is saved via chezmoi, new installs need to run the install script:
sh ~/.vim_runtime/install_awesome_vimrc.sh

to update ult vimrc:
cd ~/.vim_runtime && git pull --rebase && cd -
---------------------------



---------------------------
TODO
- bundle  repo drunk-zsh-history into chezmoi as submodule
