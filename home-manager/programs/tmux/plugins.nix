{ pkgs, ... }:
let
  inherit (pkgs)
    tmuxPlugins
    fetchFromGitHub
    ;
in
with pkgs.tmuxPlugins;
[
  tmux-powerline
  {
    plugin = tmuxPlugins.mkTmuxPlugin {
      pluginName = "treemux";
      version = "";
      src = fetchFromGitHub {
        owner = "kiyoon";
        repo = "treemux";
        rev = "master";
        sha256 = "sha256-1mCxTv3KqUsCjeI7X02NBMRJJzbL0cE1Gg20FrMDChI=";
      };
    };
    extraConfig = ''
      set -g @treemux-tree-client 'neo-tree'  # or 'nvim-tree'
      # set -g @treemux-tree-nvim-init-file '~/.local/share/tmux/plugins/treemux/configs/treemux_init.lua'

      # If you want to completely isolate the treemux's nvim config and data from your main nvim config and data, set NVIM_APPNAME.
      # This will make treemux use '~/.config/nvim-treemux', '~/.local/share/nvim-treemux'
      set -g @treemux-nvim-command 'NVIM_APPNAME=nvim-treemux nvim'
    '';
  }
  {
    plugin = tmuxPlugins.mkTmuxPlugin {
      pluginName = "tmux-window-name";
      version = "";
      src = pkgs.fetchFromGitHub {
        owner = "ofirgall";
        repo = "tmux-window-name";
        rev = "master";
        sha256 = "sha256-/ImZy4VijniRtWxrf89XRdKK+bpAOttP4ZtgPNoSrHI=";
      };
    };
    extraConfig = ''
      set -g @tmux_window_name_shells "['bash', 'fish', 'sh', 'zsh']"
      set -g @tmux_window_dir_programs "['nvim', 'vim', 'vi', 'git']"
      set -g @tmux_window_name_max_name_len "20"
      set -g @tmux_window_name_use_tilde "True"
      set -g @tmux_window_name_icon_style "'name_and_icon'"
      set -g @tmux_window_name_custom_icons '{"vim": "", "nvim": "", "python3": ""}'
    '';
  }
]
