# dotfiles

[![CI](https://github.com/tafuru/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/tafuru/dotfiles/actions/workflows/ci.yml)

Dotfiles for macOS and Ubuntu/Debian, managed with [chezmoi](https://www.chezmoi.io/).

## Managed Files

| File | Description |
|---|---|
| `~/.zshrc` | zsh main config |
| `~/.zshenv` | Environment variables (OS-specific template) |
| `~/.zaliases` | Alias definitions |
| `~/.zprofile` | Login shell config (Homebrew, etc.) |
| `~/.gitconfig` | Git config (user- and OS-specific template) |
| `~/.config/sheldon/plugins.toml` | sheldon plugin config |
| `~/.config/starship.toml` | Starship prompt config (Gruvbox Rainbow) |
| `~/.config/ghostty/config` | Ghostty terminal config |
| `~/.config/zellij/config.kdl` | Zellij terminal multiplexer config |
| `~/.config/mise/config.toml` | mise global tool config |

## Installation

If chezmoi is already installed, the recommended way is:

```bash
chezmoi init --apply github.com/tafuru/dotfiles
```

If chezmoi is not installed, use `bootstrap.sh` — it installs chezmoi automatically:

```bash
git clone https://github.com/tafuru/dotfiles.git
cd dotfiles
bash bootstrap.sh
```

On first run, you will be prompted for:

- Git name / email
- SSH signing key (optional — leave empty to skip)

For non-interactive environments, use the `--yes` flag to auto-approve the chezmoi installation:

```bash
bash bootstrap.sh --yes
```

## Design Principles

- Tools are skipped gracefully if not installed (`command -v` / `[ -f ]` / `[ -S ]` guards)
- Works standalone — no dependency on [cmdtools](https://github.com/tafuru/cmdtools)
- Supports both macOS and Ubuntu/Debian
- `.zshenv` and `.gitconfig` use chezmoi templates for OS- and user-specific configuration
- `~/.config/mise/config.toml` defines global runtimes (Rust, Node.js, Python); [dev-setup](https://github.com/tafuru/dev-setup) runs `mise install` automatically as the final step, or run it manually if applying dotfiles standalone

## Optional Setup

### 1Password SSH Agent

SSH connections and Git commit signing can be managed via 1Password.

1. Enable **Settings → Developer → Use the SSH agent** in 1Password
2. Run `bootstrap.sh` — `SSH_AUTH_SOCK` will be configured automatically

> If 1Password is not installed, `SSH_AUTH_SOCK` is left unchanged — SSH agent forwarding from a remote machine continues to work as expected.

## Related

- [dev-setup](https://github.com/tafuru/dev-setup) — Full machine setup (entry point)
- [devtools](https://github.com/tafuru/devtools) — GUI apps and fonts

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

> These are my personal dotfiles. Feel free to fork and adapt them to your own setup — just update the chezmoi templates (`*.tmpl`) with your own values.
