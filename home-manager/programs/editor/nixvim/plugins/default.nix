{
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
    {
      mode = [ "n" ];
      key = "<leader>mv";
      action = ":Markview splitToggle<CR>";
      options.desc = "Toggles `splitview` for current buffer.";
    }

  ];

  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent.char = "▏";
    };
  };

  plugins.markview = {
    enable = true;
  };

  imports = [
    ./mini
    ./lsp.nix
  ];
}
