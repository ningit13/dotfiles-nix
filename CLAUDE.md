# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

NixOS/nix-darwin dotfiles managed via Nix flakes. Supports multiple host profiles: `linux-server`, `wsl`, `work` (Linux variants via home-manager) and `mac` (nix-darwin + home-manager).

## Commands

### Apply configuration

```zsh
# Linux / WSL (home-manager)
nix run nixpkgs#home-manager -- switch --flake .#<host> --show-trace

# macOS (nix-darwin)
sudo nix run nix-darwin -- switch --flake .#<host> --show-trace
```

Hosts: `linux-server`, `wsl`, `work`, `mac`

### Format

```zsh
nix fmt
```

### Update flake inputs

```zsh
nix flake update --show-trace
```

> If experimental features aren't enabled system-wide, prepend `--extra-experimental-features 'nix-command flakes'` to any `nix` command.

## Architecture

```
flake.nix                              # Entry point; defines darwinConfigurations + homeConfigurations
hosts/
  profile.nix                          # Shared user identity defaults
  <host>/
    default.nix                        # Assembles the full configuration for that host
    profile.nix                        # Host-specific overrides: username, homeDirectory, system arch, git credentials
home-manager/
  default.nix                          # Imports misc/, programs/, services/
  desktop.nix                          # Desktop-only additions (fonts, graphical programs)
  wsl.nix                              # WSL2-only additions (SSH agent)
  fonts/                               # Font configuration
  misc/
    home/                              # Home directory settings
    xdg/                               # XDG base directory config
  programs/
    default.nix                        # Imports all program categories
    desktop.nix                        # Desktop-only program aggregator
    apps/                              # GUI applications (bitwarden, obsidian, slack)
    browser/                           # Browser config (brave)
    cli-tools/                         # CLI utilities (direnv, eza, fd, fzf, git, jq, lazygit, ripgrep, yazi, zoxide, claude-code)
    cloud/                             # Cloud tools (awscli)
    editor/
      nixvim/                          # Neovim via nixvim (common/, lsp/, plugins/)
      vscode/                          # VS Code config
    lang/                              # Language toolchains (python)
    terminal/                          # Terminal emulators and shell (alacritty, tmux, zsh)
  services/                            # systemd and WSL2 services
nix/config/                            # Shared nix daemon settings (gc, flakes, trusted-users)
nix-darwin/config/                     # macOS-only system config (brew casks, dock, fonts)
```

### Key conventions

- `hosts/profile.nix` provides shared defaults; each host's own `profile.nix` overrides as needed, passing user identity (username, homeDirectory, git name/email, system) via `specialArgs` or `extraSpecialArgs`.
- Desktop programs are gated in `home-manager/desktop.nix` — Linux desktop gets the full set; macOS gets only alacritty; `wsl` and `linux-server` get none.
- Programs are organized into category subdirectories under `home-manager/programs/`; each category has a `default.nix` and optionally a `desktop.nix` for graphical-only entries.
- nixvim is configured via the `nixvim` flake input and lives in `home-manager/programs/editor/nixvim/`.
- `nix-darwin` configs live separately from `home-manager` configs; the mac host wires them together in `hosts/mac/default.nix`.
- Formatting is enforced by `treefmt-nix` using `nixfmt`.
