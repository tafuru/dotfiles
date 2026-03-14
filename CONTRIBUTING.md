# Contributing to dotfiles

Thanks for contributing. This document covers maintainer-facing details that do not belong in the user-facing README.

## Development Principles

- Keep `README.md` user-facing. CI details, validation steps, and source-of-truth notes belong here.
- Prefer small, understandable changes over broad rewrites.
- Keep the configuration resilient when optional tools are not installed.
- Use chezmoi templates only for values that are genuinely user-specific or OS-specific.

## Source of Truth

- `home/` is the source of truth for deployed files.
- `dot_` paths are rendered to dotfiles by chezmoi, and `*.tmpl` files are rendered as templates.
- `bootstrap.sh` is the bootstrap entry point for users who do not already have `chezmoi` installed.
- `home/dot_config/nvim/` contains the Neovim configuration.
- Within Neovim, `lua/config/` holds core behavior and `lua/plugins/` holds plugin specs.

## How to Make Changes

- Edit files under `home/`, not the rendered files in `$HOME`.
- Use `*.tmpl` only when the rendered output needs per-user or per-OS values.
- Keep new Neovim plugins in their own file under `home/dot_config/nvim/lua/plugins/` when practical.
- Keep shell and Git behavior predictable across macOS and Ubuntu/Debian.
- If README needs to mention implementation details, consider whether they should live here instead.

## Validation

Recommended checks before merging:

```bash
bash bootstrap.sh --yes
```

```bash
CHEZMOI_GIT_NAME='Test User' \
CHEZMOI_GIT_EMAIL='test@example.com' \
chezmoi init --apply github.com/tafuru/dotfiles
```

```bash
nvim --headless -c 'qa'
```

On Linux, CI also runs `shellcheck` against the shell scripts and rendered shell files.

## CI Overview

CI currently validates the following:

- `shellcheck` on `bootstrap.sh` and shell-related files in `home/`
- applying the dotfiles through both `bootstrap.sh` and `chezmoi init --apply`
- existence checks for managed files derived from `home/`
- expected content in rendered Git and `mise` configuration
- a headless Neovim startup check

## Repo-Specific Notes

- New files added under `home/` automatically become part of the deployment checks in CI.
- Keep README focused on what users get, not how CI validates it.
- If you change shell/editor behavior, verify the result after rendering, not only the source template.
- If you change Neovim plugin configuration, validate both plugin sync and headless startup behavior.
