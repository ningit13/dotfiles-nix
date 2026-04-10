# dotfiles-nix

## Usage
### update flake
```zsh
nix flake update --show-trace
```

### format nix file
```zsh
nix fmt
```

### home-manager
```zsh
nix run nixpkgs#home-manager -- switch --flake .#<host> --show-trace
```

### nix-darwin (mac)
```zsh
sudo nix run nix-darwin -- switch --flake .#<host> --show-trace
```

### Appendix
If needed, add below extra option above commands.
```zsh
--extra-experimental-features 'nix-command flakes'
```
