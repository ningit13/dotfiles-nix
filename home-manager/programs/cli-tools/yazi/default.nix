{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "yy";
    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
        sort_by = "natural";
      };

      preview = {
        image_filter = "triangle";
        image_quality = 50;
      };
    };
  };
}
