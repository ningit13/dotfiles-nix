{
  plugins.mini = {
    modules = {
      cursorword = { };
      icons = { };
      statusline = { };
      starter = { };
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
