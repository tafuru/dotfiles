#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$DOTFILES_DIR/home"
YES=false

info()    { echo "[dotfiles] $*"; }
success() { echo "[dotfiles] ✓ $*"; }
warn()    { echo "[dotfiles] ! $*" >&2; }
fatal()   { echo "[dotfiles] ✗ $*" >&2; exit 1; }

for arg in "$@"; do
  case "$arg" in
    -y|--yes) YES=true ;;
  esac
done

if ! command -v chezmoi &>/dev/null; then
  info "chezmoi not found"
  if [ "$YES" = false ]; then
    read -rp "[dotfiles] Install chezmoi to \$HOME/.local/bin? [y/N]: " answer
    if [[ ! "$answer" =~ ^[Yy]$ ]]; then
      fatal "Installation cancelled — chezmoi is required to apply dotfiles"
    fi
  fi
  info "Installing chezmoi"
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
  success "chezmoi installed"
fi

info "Applying dotfiles"
chezmoi init --apply --source "$SOURCE_DIR"
success "Dotfiles applied — restart your shell to apply changes"
