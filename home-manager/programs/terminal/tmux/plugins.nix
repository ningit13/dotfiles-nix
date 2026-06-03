{ pkgs, ... }:
let
  inherit (pkgs)
    tmuxPlugins
    fetchFromGitHub
    ;

  load-avg = tmuxPlugins.mkTmuxPlugin {
    pluginName = "load-avg";
    version = "";
    rtpFilePath = "load_average.tmux";
    src = fetchFromGitHub {
      owner = "dastergon";
      repo = "tmux-load-avg";
      rev = "master";
      sha256 = "sha256-wYSku4doevRseid0kWu41FtRu5D6TvT6jPicp2H7kh8=";
    };
  };
  ram = tmuxPlugins.mkTmuxPlugin {
    pluginName = "ram";
    version = "";
    rtpFilePath = "ram.tmux";
    src = fetchFromGitHub {
      owner = "pwittchen";
      repo = "tmux-plugin-ram";
      rev = "master";
      sha256 = "sha256-bouct+f0FdRjx7+stAOzTb1Ozg+vjr3MmyLabL+ThzM=";
    };
  };
  window-name = tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-window-name";
    version = "";
    rtpFilePath = "tmux_window_name.tmux";
    src = fetchFromGitHub {
      owner = "ofirgall";
      repo = "tmux-window-name";
      rev = "master";
      sha256 = "sha256-YI2s/OtywKJQAPpb07dCbWA/6+sWAl+DB+QQbvZOG5k=";
    };
  };
  session-dots = tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-session-dots";
    version = "";
    rtpFilePath = "session-dots.tmux";
    src = fetchFromGitHub {
      owner = "jtmcginty";
      repo = "tmux-session-dots";
      rev = "main";
      sha256 = "sha256-ZhJATZcoeBhTTrQQzWqoin54chtilvYfa3o8G4Nf3jA=";
    };
  };

in
with pkgs.tmuxPlugins;
[
  {
    plugin = sensible;
    extraConfig = ''
      set -g status-left "#h [#S] #{tmux_mode_indicator}"
      set -g status-right "#{session_dots} \
                           #[fg=colour251] Mem:#{ram}  Load:#{load_average} \
                           #[fg=colour172] %H:%M  %Y/%m/%d  %a  󰨳 %U"
    '';
  }
  resurrect
  {
    plugin = continuum;
    extraConfig = ''
      set -g @continuum-restore 'on'
    '';
  }
  {
    plugin = mode-indicator;
    extraConfig = ''
      set -g @mode_indicator_prefix_prompt "Wait"
      set -g @mode_indicator_copy_prompt   "Copy"
      set -g @mode_indicator_sync_prompt   "Sync"
      set -g @mode_indicator_empty_prompt  "Tmux"
      set -g @mode_indicator_prefix_mode_style "bg=colour235,fg=blue"
      set -g @mode_indicator_copy_mode_style   "bg=colour235,fg=yellow"
      set -g @mode_indicator_sync_mode_style   "bg=colour235,fg=red"
      set -g @mode_indicator_empty_mode_style  "bg=colour235,fg=lightgreen"
    '';
  }
  { plugin = load-avg; }
  { plugin = ram; }
  {
    plugin = window-name;
    extraConfig = ''
      set -g @tmux_window_name_shells "['zsh', 'bash']"
      set -g @tmux_window_dir_programs "['nvim', 'git']"
      set -g @tmux_window_name_max_name_len "10"
      set -g @tmux_window_name_use_tilde "True"
      set -g @tmux_window_name_icon_style "'name_and_icon'"
      set -g @tmux_window_name_custom_icons '{"nvim": "", "python3": ""}'
    '';
  }
  {
    plugin = session-dots;
    extraConfig = ''
      set -g @session-dots-color "#6188f1"
    '';
  }
]
