{ profile, ... }:
{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      key = profile.gitSigningKey;
      signByDefault = true;
    };

    settings = {
      user = {
        name = profile.gitUserName;
        email = profile.gitUserEmail;
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
