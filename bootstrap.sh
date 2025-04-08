#!/usr/bin/env sh
# POSIX-compliant, ShellCheck-clean, Bash & Zsh compatible

# Get absolute path to script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

# Update repo
git pull origin main

# Install Xcode Command Line Tools if missing
if ! xcode-select -p > /dev/null 2>&1; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed"
fi

doIt() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms . ~

  # shellcheck source=$HOME/.zshrc
  [ -f "$HOME/.zshrc" ] && . "$HOME/.zshrc"
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
  doIt
else
  printf "This may overwrite existing files in your home directory. Are you sure? (y/n) "
  read -r REPLY
  # Strip carriage return and trim to first character (POSIX-safe)
  REPLY=$(printf "%s" "$REPLY" | tr -d '\r')
  REPLY=${REPLY%"${REPLY#?}"}
  printf "\n"
  if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ]; then
    doIt
  fi
fi

unset -f doIt
