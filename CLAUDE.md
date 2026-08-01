# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

NixOS/nix-darwin dotfiles managed via Nix flakes. Supports multiple host profiles: `linux-server`, `wsl` (Linux variants via home-manager), `mac` (nix-darwin + home-manager), and `nixos` (full NixOS with embedded home-manager).

## Commands

### Apply configuration

```zsh
# Linux / WSL (home-manager)
nix run nixpkgs#home-manager -- switch --flake .#<host> --show-trace

# NixOS
sudo nixos-rebuild switch --flake .#<host> --show-trace

# macOS (nix-darwin)
sudo nix run nix-darwin -- switch --flake .#<host> --show-trace
```

Hosts: `linux-server`, `wsl`, `nixos`, `mac`

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
flake.nix                              # Entry point; defines darwinConfigurations + nixosConfigurations + homeConfigurations
hosts/
  profile.nix                          # Shared user identity defaults
  <host>/
    default.nix                        # Assembles the full configuration for that host
    profile.nix                        # Host-specific overrides: username, homeDirectory, system arch, git credentials
    hardware-configuration.nix         # (nixos only) hardware scan output
home-manager/
  default.nix                          # Imports misc/, programs/, services/
  desktop.nix                          # Desktop-only additions (graphical programs)
  wsl.nix                              # WSL2-only additions (SSH agent)
  misc/
    home/                              # Home directory settings
    xdg/                               # XDG base directory config
  programs/
    default.nix                        # Imports all program categories
    desktop.nix                        # Desktop-only program aggregator
    apps/                              # GUI applications (bitwarden, obsidian, slack)
    browser/                           # Browser config (brave, firefox)
    cli-tools/                         # CLI utilities (bat, claude-code, direnv, eza, fd, fzf, glow, jq, pandoc, ripgrep, yazi, zoxide)
    cloud/                             # Cloud tools (awscli)
    editor/
      nixvim/                          # Neovim via nixvim (common/, lsp/, plugins/)
      vscode/                          # VS Code config
    lang/                              # Language toolchains (python)
    terminal/                          # Terminal emulators and shell (alacritty, tmux, zsh)
    vcs/                               # Version control tools (gh, git, lazygit, ydiff)
    wm/                                # Wayland desktop session (niri, fuzzel, waybar, mako, kanshi, swayidle, swaylock, swayosd, awww, cliphist, wl-clipboard); Linux-only
  services/                            # systemd and WSL2 services
nix/config/                            # Shared nix daemon settings (gc, flakes, trusted-users)
nix-darwin/config/                     # macOS-only system config (brew casks, dock, fonts)
nixos/
  default.nix                          # Imports all NixOS config modules
  config/
    boot.nix                           # Bootloader settings
    console.nix                        # Virtual console keymap
    fonts.nix                          # System-wide font packages
    i18n.nix                           # Locale settings
    networking.nix                     # Hostname and network settings
    nix.nix                            # Nix daemon settings for NixOS
    security.nix                       # PAM services (swaylock)
    services.nix                       # Display manager, GNOME desktop, keymap, sound
    system.nix                         # stateVersion and other system-level options
    time.nix                           # Time zone
    users.nix                          # User accounts and groups
    wm.nix                             # niri session registration
```

### Key conventions

- `hosts/profile.nix` provides shared defaults; each host's own `profile.nix` overrides as needed, passing user identity (username, homeDirectory, git name/email, system) via `specialArgs` or `extraSpecialArgs`.
- Desktop programs are gated in `home-manager/desktop.nix` — Linux desktop gets the full set; macOS gets only alacritty; `wsl` and `linux-server` get none.
- Programs are organized into category subdirectories under `home-manager/programs/`; each category has a `default.nix` and optionally a `desktop.nix` for graphical-only entries.
- nixvim is configured via the `nixvim` flake input and lives in `home-manager/programs/editor/nixvim/`.
- `nix-darwin` configs live separately from `home-manager` configs; the mac host wires them together in `hosts/mac/default.nix`.
- The `nixos` host uses `nixosSystem` and embeds home-manager via `home-manager.nixosModules.home-manager`, so no separate `home-manager switch` is needed — `nixos-rebuild` applies both.
- NixOS system-level modules live in `nixos/config/`; host-specific hardware config is in `hosts/nixos/hardware-configuration.nix`.
- The niri session is split: package/session registration is NixOS-level (`nixos/config/wm.nix`) and swaylock PAM lives in `nixos/config/security.nix`; user config (`config.kdl`, launcher, bar, etc.) lives in `home-manager/programs/wm/`, gated to Linux in `home-manager/programs/desktop.nix`.
- Formatting is enforced by `treefmt-nix` using `nixfmt`.
