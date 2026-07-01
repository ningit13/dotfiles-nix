{
  plugins = {
    neo-tree = {
      enable = true;
      settings = {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false;
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
