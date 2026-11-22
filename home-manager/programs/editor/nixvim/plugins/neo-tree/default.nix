{
  plugins = {
    neo-tree = {
      enable = true;
      settings = {
        close_if_last_window = true;
        filesystem = {
          filtered_items = {
            hide_dotfiles = false;
          };
        };

        default_component_configs = {
          git_status = {
            symbols = {
              # Change type
              added = "N";
              deleted = "D";
              modified = "M";
              renamed = "R";
              # Status type
              untracked = "U";
              ignored = "I";
              unstaged = "󰄱";
              staged = "";
              conflict = "";
            };
          };
        };
      };
    };

    # required for neo-tree (optional)
    web-devicons = {
      enable = true;
    };
  };
}
