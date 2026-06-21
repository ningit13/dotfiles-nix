{
  plugins.undotree = {
    enable = true;
    settings = {
      WindowLayout = 3;
    };
  };

  userCommands = {
    UndotreeToggleAndFocus = {
      command = ":UndotreeToggle | :UndotreeFocus";
      desc = "Toggle and focus Undotree";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggleAndFocus<CR>";
    }
  ];
}
