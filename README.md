# dotfiles-nix

NixOS/nix-darwin dotfiles managed via Nix flakes.

## Prerequisites

[Nix](https://nixos.org/download/) must be installed on your system before using this repository.

## Hosts

| Host | Platform | Manager |
|------|----------|---------|
| `linux` | Linux (non-NixOS) | home-manager |
| `linux-server` | Linux server | home-manager |
| `wsl` | WSL2 | home-manager |
| `work` | Linux (work machine) | home-manager |
| `mac` | macOS | nix-darwin + home-manager |

## Usage

### Apply configuration

**Linux / WSL** — apply home-manager configuration for the given host:

```zsh
nix run nixpkgs#home-manager -- switch --flake .#<host> --show-trace
```

**macOS** — apply nix-darwin configuration (requires `sudo` to manage system settings):

```zsh
sudo nix run nix-darwin -- switch --flake .#<host> --show-trace
```

### Update flake inputs

Fetches the latest versions of all flake dependencies (nixpkgs, home-manager, etc.):

```zsh
nix flake update --show-trace
```

### Format

Formats all Nix files using `nixfmt` (enforced by pre-commit hook):

```zsh
nix fmt
```

## Development shell

Enter the dev shell to get `nil` (Nix LSP) and pre-commit hooks installed:

```zsh
direnv allow   # auto-activates the shell via .envrc
# or manually:
nix develop
```

## Troubleshooting

### Experimental features not enabled system-wide

If you see an error about `nix-command` or `flakes` not being enabled, prepend the following flag to any `nix` command:

```zsh
--extra-experimental-features 'nix-command flakes'
```

Example:

```zsh
nix run nixpkgs#home-manager --extra-experimental-features 'nix-command flakes' -- switch --flake .#wsl --show-trace
```

### `nix-daemon` not trusting your user (non-NixOS Linux)

On non-NixOS Linux, the Nix daemon only builds for trusted users. If you get permission errors, add your username to `/etc/nix/nix.conf`:

```conf
# /etc/nix/nix.conf
trusted-users = root <your-username>
```

Then restart the daemon to apply the change:

```zsh
sudo systemctl restart nix-daemon
```
