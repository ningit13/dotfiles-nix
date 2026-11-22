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
  ];
}
