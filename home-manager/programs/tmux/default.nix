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

      # reload config file with prefix + r
      bind-key r source-file $XDG_CONFIG_HOME/tmux/tmux.conf \; display-message "Config reloaded!"

      # display popup
      bind-key P display-popup -E -w 60% -h 60% -x C

      # synchronize panes
      bind-key a set-window-option synchronize-panes

      # extra key bidings
      bind-key -n M-s if -F "#{==:#{prefix},C-f}" \
          "set-option -g prefix C-a ; \
          unbind-key C-f ; \
          bind-key C-f send-prefix" \
          "set-option -g prefix C-f ; \
          unbind-key C-a ; \
          bind-key C-a send-prefix"
    '';
  };

  xdg.configFile.tmux-powerline.source = ./config/tmux-powerline;
}
