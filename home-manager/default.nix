{
  pkgs,
  config,
  ...
}:
{
  home = {
    stateVersion = "25.11";

    packages = with pkgs; [
      git
      curl
    ];
  };

  imports = [
    ./misc
    ./programs
    ./services
  ];
}
