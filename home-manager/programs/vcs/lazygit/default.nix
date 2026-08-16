{
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "lg";

    settings = {
      gui = {
        nerdFontsVersion = "3";
        sidePanelWidth = 0.2; # gives you more space to show things side-by-side
      };
      git = {
        command = [
          {
            colorArg = "never";
            pager = "ydiff -p cat -s --wrap --width={{columnWidth}}";
          }
        ];
      };
    };
  };
}
