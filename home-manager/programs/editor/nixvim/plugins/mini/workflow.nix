{
  plugins.mini = {
    modules = {
      pick = { };
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<C-u><C-u>";
      action = ":lua MiniPick.builtin.files({ tool = 'git' })<CR>";
      options.desc = "List all files recursively. { tool = 'git' }";
    }
    {
      mode = [ "n" ];
      key = "<C-u><C-b>";
      action = ":lua MiniPick.builtin.buffers()<CR>";
      options.desc = "Pick from buffers.";
    }
    {
      mode = [ "n" ];
      key = "<C-u><C-g>";
      action = ":lua MiniPick.builtin.grep_live()<CR>";
      options.desc = "Pick from pattern matches with live feedback.";
    }
  ];
}
