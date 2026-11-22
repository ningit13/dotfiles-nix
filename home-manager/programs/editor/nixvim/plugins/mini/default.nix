{
  plugins.mini = {
    enable = true;

    modules = {
      statusline = { };
      pairs = { };
      git = { };
      surround = { };
      completion = { };
      # fuzzy = { };
      # snippets = { };

      # sessions = {
      #   autowrite = true;
      #   autoread = false;
      # };
    };

    # Show only the filename in the statusline, not the full path
    luaConfig.content = ''
      require("mini.statusline").section_filename = function()
        if vim.bo.buftype == "terminal" then
          return "%t"
        end
        return "%f"
      end
    '';
  };
}
