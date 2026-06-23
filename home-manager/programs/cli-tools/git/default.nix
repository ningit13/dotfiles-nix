{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB+r3PKmqWo7dZ7sqhdMJ+19Kzn3YDV6zdYIbB7BGGhR";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "ningit13";
        email = "ningit13@pm.me";
      };

      alias = {
        ch = "checkout";
        cm = "commit";
        st = "status";
        br = "branch";
        sw = "switch";
      };

      init = {
        defaultBranch = "main";
      };

      fetch = {
        prune = true;
        pruneTags = true;
      };
    };
  };
}
