# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

NixOS/nix-darwin dotfiles managed via Nix flakes. Supports multiple host profiles: `linux`, `linux-server`, `wsl`, `work` (Linux variants via home-manager) and `mac` (nix-darwin + home-manager).

## Commands

### Apply configuration

```zsh
# Linux / WSL (home-manager)
nix run nixpkgs#home-manager -- switch --flake .#<host> --show-trace

# macOS (nix-darwin)
sudo nix run nix-darwin -- switch --flake .#<host> --show-trace
```

Hosts: `linux`, `linux-server`, `wsl`, `work`, `mac`

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
flake.nix                     # Entry point; defines darwinConfigurations + homeConfigurations
hosts/<host>/
  default.nix                 # Assembles the full configuration for that host
  profile.nix                 # Host-specific values: username, homeDirectory, system arch, git credentials
home-manager/
  default.nix                 # Imports misc/, programs/, services/
  graphical.nix               # Platform-aware graphical programs (alacritty, bitwarden, brave, obsidian, vscode)
  wsl.nix                     # WSL2-only additions (SSH agent)
  programs/<tool>/default.nix # Per-program home-manager config
  services/                   # systemd and WSL2 services
nix/config/                   # Shared nix daemon settings (gc, flakes, trusted-users)
nix-darwin/config/            # macOS-only system config (brew casks, dock, fonts)
```

### Key conventions

- Each host's `profile.nix` passes user identity (username, homeDirectory, git name/email, system) into the shared modules via `specialArgs` or `extraSpecialArgs`.
- Graphical programs are gated in `home-manager/graphical.nix` — Linux gets the full set; macOS gets only alacritty; `wsl` and `linux-server` get none.
- nixvim is configured via the `nixvim` flake input and lives in `home-manager/programs/nixvim/`.
- `nix-darwin` configs live separately from `home-manager` configs; the mac host wires them together in `hosts/mac/default.nix`.
- Formatting is enforced by `treefmt-nix` using `nixfmt`.
