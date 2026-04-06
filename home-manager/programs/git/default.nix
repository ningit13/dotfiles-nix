{ profile, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = profile.gitUserName;
        email = profile.gitUserEmail;
      };

      init = {
        defaultBranch = "main";
      };
    };
  };
}
