{
  plugins.mini = {
    enable = true;

    modules = {
      surround = { };
      statusline = { };
      git = { };
      completion = { };
      fuzzy = { };
      snippets = { };

      sessions = {
        autowrite = true;
        autoread = false;
      };
    };
  };
}
