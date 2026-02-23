#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$DOTFILES_DIR/home"
YES=false

for arg in "$@"; do
  case "$arg" in
    -y|--yes) YES=true ;;
  esac
done

if ! command -v chezmoi &>/dev/null; then
  echo "chezmoi is not found on this system."
  if [ "$YES" = false ]; then
    read -rp "  Install chezmoi to \$HOME/.local/bin? [y/N]: " answer
    if [[ ! "$answer" =~ ^[Yy]$ ]]; then
      echo "Installation cancelled. chezmoi is required to apply dotfiles."
      exit 1
    fi
  fi
  echo "  Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
  echo "  chezmoi installed successfully."
fi

echo "Applying dotfiles..."
chezmoi apply --source "$SOURCE_DIR"
echo "All done. Restart your shell to apply changes."
