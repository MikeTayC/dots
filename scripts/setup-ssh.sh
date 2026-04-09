#!/usr/bin/env bash

set -e

SSH_DIR="$HOME/.ssh"
DEFAULT_KEY_NAME="id_ed25519"

echo "==> SSH Setup for Git (GitHub + Bitbucket)"

# Prompt for email
read -rp "Enter your Git email: " EMAIL

# Prompt for key name (with default)
read -rp "Enter SSH key name [$DEFAULT_KEY_NAME]: " KEY_NAME
KEY_NAME="${KEY_NAME:-$DEFAULT_KEY_NAME}"

KEY_PATH="$SSH_DIR/$KEY_NAME"

# Prompt for providers
echo "Select Git providers to configure:"
echo "1) GitHub"
echo "2) Bitbucket"
echo "3) Both"
read -rp "Choice [1/2/3]: " PROVIDER_CHOICE

# Create SSH directory
echo "==> Creating SSH directory"
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Check if key exists
if [ -f "$KEY_PATH" ]; then
  read -rp "Key already exists at $KEY_PATH. Overwrite? (y/N): " OVERWRITE
  if [[ ! "$OVERWRITE" =~ ^[Yy]$ ]]; then
    echo "Skipping key generation."
  else
    rm -f "$KEY_PATH" "$KEY_PATH.pub"
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
  fi
else
  echo "==> Generating SSH key"
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
fi

# Start ssh-agent if needed
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  echo "==> Starting ssh-agent"
  eval "$(ssh-agent -s)"
fi

echo "==> Adding key to agent"
ssh-add "$KEY_PATH" 2>/dev/null || ssh-add --apple-use-keychain "$KEY_PATH" 2>/dev/null || true

CONFIG_FILE="$SSH_DIR/config"
touch "$CONFIG_FILE"
chmod 600 "$CONFIG_FILE"

add_host() {
  local host_alias=$1
  local hostname=$2

  if grep -q "Host $host_alias" "$CONFIG_FILE"; then
    echo "Config for $host_alias already exists, skipping."
  else
    echo "==> Adding config for $host_alias"
    cat <<EOF >> "$CONFIG_FILE"

Host $host_alias
  HostName $hostname
  User git
  IdentityFile $KEY_PATH
  IdentitiesOnly yes
EOF
  fi
}

case "$PROVIDER_CHOICE" in
  1)
    add_host "github.com" "github.com"
    ;;
  2)
    add_host "bitbucket.org" "bitbucket.org"
    ;;
  3)
    add_host "github.com" "github.com"
    add_host "bitbucket.org" "bitbucket.org"
    ;;
  *)
    echo "Invalid choice, skipping provider config."
    ;;
esac

echo
echo "==> Your public key (add this to your Git provider):"
echo "--------------------------------------------------"
cat "$KEY_PATH.pub"
echo "--------------------------------------------------"

echo
echo "==> Test your connection:"
echo "ssh -T git@github.com"
echo "ssh -T git@bitbucket.org"

echo
echo "Done."
