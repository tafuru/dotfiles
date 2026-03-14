# dotfiles

[![CI](https://github.com/tafuru/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/tafuru/dotfiles/actions/workflows/ci.yml)

Personal dotfiles for macOS and Ubuntu/Debian, managed with [chezmoi](https://www.chezmoi.io/). They provide the configuration layer for this setup, covering the shell, Git, terminal tools, runtimes, and a modular Neovim configuration.

## Quick Start

If `chezmoi` is already installed, the recommended way is:

```bash
chezmoi init --apply github.com/tafuru/dotfiles
```

If `chezmoi` is not installed yet, use `bootstrap.sh`:

```bash
git clone https://github.com/tafuru/dotfiles.git
cd dotfiles
bash bootstrap.sh
```

On first run, you will be prompted for your Git name and email address. You can also leave the SSH signing key empty to skip signing setup.

For non-interactive environments, use:

```bash
bash bootstrap.sh --yes
```

For the full machine setup, including CLI tools, runtimes, and optional GUI apps, start with [dev-setup](https://github.com/tafuru/dev-setup).

## When to Use This Repository

- Use this repository when you want the configuration layer only.
- Use [dev-setup](https://github.com/tafuru/dev-setup) when you want the full machine bootstrap.
- Use [cmdtools](https://github.com/tafuru/cmdtools) and [devtools](https://github.com/tafuru/devtools) directly only when you want to manage those layers independently.

## What It Manages

| Area | What you get |
|---|---|
| Shell | `zsh` configuration, aliases, plugins via `sheldon`, and prompt integration |
| Git and SSH | Git defaults managed with chezmoi templates plus optional 1Password-backed SSH agent and signing support |
| Terminal tools | Configuration for Ghostty, Zellij, Starship, and related terminal workflow tools |
| Runtimes | Global `mise` runtime definitions for tools such as Rust, Node.js, and Python |
| Neovim | A modular Lua-based configuration with `lazy.nvim`, Gruvbox, Telescope, Neo-tree, Treesitter, LSP, formatting, and completion |

Exact file layout lives in the repository. Maintainer-facing notes about templates, validation, and CI live in [CONTRIBUTING.md](CONTRIBUTING.md).

## Neovim Highlights

Neovim is configured under `~/.config/nvim/` and split into `lua/config/` for core behavior and `lua/plugins/` for plugin specs.

| Feature | Details |
|---|---|
| Theme | Gruvbox Dark |
| Finder and navigation | Telescope on `<leader>ff` and `<leader>fg`, plus Neo-tree on `<leader>e` |
| Editing experience | Treesitter, `mini.nvim`, `blink.cmp`, and `conform.nvim` |
| Language support | `nvim-lspconfig` with Mason-managed language servers |

## Design Principles

- Works standalone and does not depend on [cmdtools](https://github.com/tafuru/cmdtools).
- Supports both macOS and Ubuntu/Debian.
- Uses chezmoi templates for OS-specific and user-specific values.
- Skips optional integrations gracefully when the underlying tool is not installed.
- Defines runtimes in `~/.config/mise/config.toml`; [dev-setup](https://github.com/tafuru/dev-setup) runs `mise install` automatically, or you can run it manually after applying the dotfiles.

## Related Repositories

| Repository | Responsibility |
|---|---|
| [dev-setup](https://github.com/tafuru/dev-setup) | Full machine setup and orchestration |
| [cmdtools](https://github.com/tafuru/cmdtools) | CLI tool installation |
| [devtools](https://github.com/tafuru/devtools) | Optional GUI apps and fonts |

## Contributing

README stays focused on user-facing setup and behavior. For CI details, validation commands, and repository conventions, see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

> These are my personal dotfiles. Feel free to fork and adapt them to your own setup — just update the chezmoi templates (`*.tmpl`) with your own values.
