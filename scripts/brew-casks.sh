#!/usr/bin/env bash
set -e
dev_apps=(google-chrome firefox vivaldi iterm2 visual-studio-code grammarly-desktop pearcleaner)
# -----------------------------
# Usage
# -----------------------------
usage() {
  cat << EOF
Usage: $(basename "$0") <command> [options]

Commands:
  apps        Install dev apps via Homebrew Cask
  dock        Configure macOS Dock

Options (apps):
  -a "list"   Custom list of apps to install
  -h          Show help

Examples:
  $0 apps
  $0 apps -a "docker visual-studio-code"
  $0 dock
EOF
}

# -----------------------------
# Apps installer
# -----------------------------
install_apps() {
  local custom_apps="$1"

  if [[ -n "$custom_apps" ]]; then
    # Convert string to array
    read -r -a dev_apps <<< "$custom_apps"
  fi

  echo "Installing apps: ${dev_apps[*]}"

  # Ensure brew exists
  if ! command -v brew >/dev/null 2>&1; then
    echo "FAIL - Homebrew must be installed first"
    exit 1
  fi

  for app in "${dev_apps[@]}"; do
    if brew list --cask "$app" >/dev/null 2>&1; then
      echo "✓ $app already installed"
    else
      echo "→ Installing $app"
      brew install --cask "$app"
    fi
  done
}

# -----------------------------
# Dock setup
# -----------------------------
setup_dock() {
  # System apps
  sys=(/System/Applications/"System Settings.app")

  dockItems=( "${apps[@]}" "${sys[@]}" )

  echo "Resetting Dock..."

  defaults write com.apple.dock persistent-apps -array

  for i in "${dockItems[@]}"; do
    echo "Adding $i to Dock..."
    defaults write com.apple.dock persistent-apps -array-add \
      "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$i</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  done

  echo "Restarting Dock..."
  killall Dock

  echo "Dock setup complete!"
}

# -----------------------------
# Command dispatcher
# -----------------------------
cmd="$1"
shift || true

case "$cmd" in
  apps)
    # parse flags for apps
    custom_apps=""

    while getopts ":a:h" opt; do
      case "$opt" in
        a) custom_apps="$OPTARG" ;;
        h) usage; exit 0 ;;
        *) usage; exit 1 ;;
      esac
    done

    install_apps "$custom_apps"
    ;;

  dock)
    setup_dock
    ;;

  ""|-h|--help|help)
    usage
    ;;

  *)
    echo "Unknown command: $cmd"
    usage
    exit 1
    ;;
esac
