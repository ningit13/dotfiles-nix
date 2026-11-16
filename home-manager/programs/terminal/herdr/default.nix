{
  programs.herdr = {
    enable = true;

    settings = {
      keys = {
        detach = "prefix+d";
        next_workspace = "prefix+ctrl+]";
        navigate_workspace_up = "k";
        navigate_workspace_down = "j";

        command = [
          {
            key = "prefix+alt+g";
            description = "run lazygit";
            command = "lazygit";
            type = "popup";
            width = "100%";
            height = "100%";
          }
          {
            key = "prefix+alt+y";
            description = "run yazi";
            command = "yazi";
            type = "popup";
            width = "80%";
            height = "80%";
          }
          # plugin actions
          {
            key = "prefix+a";
            description = "broadcast to all panes";
            command = "abroller666.broadcast-pane.open";
            type = "plugin_action";
          }
        ];
      };

      theme = {
        auto_switch = false;
        name = "tokyo-night";
      };

      ui = {
        prompt_new_tab_name = false;
        pane_gaps = false;
        tab_bar_position = "bottom";
        tab_bar_right = [
          {
            type = "zoom";
          }
          {
            type = "datetime";
            format = "%H:%M  %Y/%m/%d  %a";
          }
        ];
        tab_bar_right_separator = "  ";

        sidebar.spaces.rows = [
          [
            "state_icon"
            "workspace"
            "branch"
            "git_status"
          ]
          [
            {
              token = "$topic";
              bold = true;
              dim = false;
            }
          ]
        ];
      };
    };
  };
}
