{
  plugins.mini = {
    enable = true;

    modules = {
      cursorword = { };
      icons = { };
      pairs = { };
      pick = { };
      statusline = { };
      surround = { };
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

  plugins.lazygit = {
    enable = true;
    settings = {
      floating_window_winblend = 10;
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>gg";
      action = ":LazyGit<CR>";
      options.desc = "Open LazyGit with floating window";
    }
  ];

  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent.char = "▏";
    };
  };
}
