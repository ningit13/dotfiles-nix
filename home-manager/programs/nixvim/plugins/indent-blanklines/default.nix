{
  plugins.indent-blankline = {
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
}
