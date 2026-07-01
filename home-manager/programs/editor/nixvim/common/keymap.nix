{
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
  ];
}
