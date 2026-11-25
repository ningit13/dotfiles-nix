{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = true;
      };
    };

    opts = {
      number = true;
      cursorline = true;
      # Enable global status line.
      laststatus = 3;
      signcolumn = "yes:2";

      # Use system clipboard for all yank/paste operations
      clipboard = "unnamedplus";

      # Allow l to move to the next line at end of line
      whichwrap = "b,s,l,h,<,>,[,]";

      expandtab = true;
      cindent = true;
      ignorecase = true;

      # Disable swap files and enable undo files for persistent undo history
      swapfile = false;
      undofile = true;
      undolevels = 10000;
    };

    extraConfigLua = ''
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#613d3d" })
    '';

    imports = [
      ./plugins
      ./keymaps.nix
    ];
  };
}
