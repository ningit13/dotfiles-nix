{
  plugins = {
    blink-cmp = {
      enable = true;
    };

    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "";
          highlight = [
            "CursorColumn"
            "Whitespace"
          ];
        };
        whitespace = {
          remove_blankline_trail = false;
          highlight = [
            "CursorColumn"
            "Whitespace"
          ];
        };
        scope = {
          enabled = false;
        };
      };
    };

    mini-surround = {
      enable = true;
    };

    neo-tree = {
      enable = true;
    };
    # required for neo-tree (optional)
    web-devicons = {
      enable = true;
    };

    undotree = {
      enable = true;
      settings = {
        WindowLayout = 3;
      };
    };
  };
}
