{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-f";
    # Override the hjkl and HJKL bindings for pane navigation and resizing in VI mode.
    customPaneNavigationAndResize = true;
    resizeAmount = 5;
    sensibleOnTop = true;
    plugins = import ./plugins.nix { inherit pkgs; };

    extraConfig = ''
      # set pane border color
      set-option -g pane-active-border-style "fg=brightgreen"
      set-option -g pane-border-style        "fg=brightblack"

      # Change prefix key C-b -> C-f
      bind-key | split-window -h     # split window horizontally
      bind-key - split-window -v     # split window vertically

      bind-key z   resize-pane -Z    # resize toggle zoomed and unzoomed

      bind-key C-j swap-pane -D        # swap pane to Down
      bind-key C-k swap-pane -U        # swap pane to Up

      bind-key C-[ switch-client -p    # switch to previous session
      bind-key C-] switch-client -n    # switch to next session

      # reload config file with prefix + r
      bind-key r source-file $XDG_CONFIG_HOME/tmux/tmux.conf \; display-message "Config reloaded!"

      # display popup
      bind-key P display-popup -E -w 60% -h 60% -x C

      # synchronize panes
      bind-key a set-window-option synchronize-panes

      set -g status-right-length 80
      set -g status-left-length 80
      set -g status-style "bg=colour235,fg=white"

      # set window status
      set -g status-justify centre
      set -g window-status-current-style reverse
      set -g window-status-format "#I:#W"
      set -g window-status-current-format "#I:#W"
    '';
  };
}
