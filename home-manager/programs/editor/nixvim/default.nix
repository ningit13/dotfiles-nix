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

      # Use system clipboard for all yank/paste operations
      clipboard = "unnamedplus";

      # Allow l to move to the next line at end of line
      whichwrap = "b,s,l,h,<,>,[,]";

      expandtab = true;

      # Disable swap files and enable undo files for persistent undo history
      swapfile = false;
      undofile = true;
      undolevels = 10000;
    };

    keymaps = [
      {
        mode = [ "i" ];
        key = "jj";
        action = "<Esc>";
        options.desc = "Exit insert mode";
      }
      {
        mode = [ "n" ];
        key = "<leader>o";
        action = "o<Esc>k";
        options.desc = "Add blank line below without entering insert mode";
      }
      {
        mode = [ "n" ];
        key = "<leader>O";
        action = "O<Esc>j";
        options.desc = "Add blank line above without entering insert mode";
      }
      {
        mode = [ "n" ];
        key = "H";
        action = "^";
        options.desc = "Jump to first non-blank character of line";
      }
      {
        mode = [ "n" ];
        key = "L";
        action = "$";
        options.desc = "Jump to end of line";
      }
      {
        mode = [ "n" ];
        key = "<C-j>";
        action = "<C-e>";
        options.desc = "Scroll view down one line";
      }
      {
        mode = [ "n" ];
        key = "<C-k>";
        action = "<C-y>";
        options.desc = "Scroll view up one line";
      }
      {
        mode = [ "i" ];
        key = "<C-h>";
        action = "<Left>";
        options.desc = "Move cursor left";
      }
      {
        mode = [ "i" ];
        key = "<C-l>";
        action = "<Right>";
        options.desc = "Move cursor right";
      }
    ];

    imports = [
      ./plugins
    ];
  };
}
