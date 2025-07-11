set -e

# -- Functions --
usage() {
  cat << EOF
Usage: $(basename $0) [-h] [-a app-list]
This idempotent macOS Bash script uses Homebrew Cask to install basic dev apps...
  * Docker Desktop
  * VS Code
  * Browsers
    - Chrome
    - Firefox

OPTIONS
  -h           display help
  -a app-list  list of brew cask apps to install
               e.g. -a "docker visual-studio-code"
EOF
}

# -- Command Line Options --
# Command line arguments over interactive
#while getopts 'a:h' opt; do
#  case "$opt" in
#
#    a)
#      dev_apps="$OPTARG"
#      ;;
#
#    ?|h)
#    usage
#    exit
#      ;;
#  esac
#done
#shift "$(($OPTIND -1))"

# -- MAIN --
dev_apps=(google-chrome firefox vivaldi iterm2 visual-studio-code webstorm grammarly-desktop pearcleaner)
echo "Homebrew installing apps [${dev_apps[*]}]"

# Homebrew is required
brew help > /dev/null || \
  (echo "FAIL [1] - Homebrew must be installed first" ; exit 1)

# Install app (or not)
for app in ${dev_apps[@]}; do
    brew list --cask "$app"
    brew install --cask "$app"
done
