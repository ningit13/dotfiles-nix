{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://yazi.cachix.org"
      "https://ningit.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      "ningit.cachix.org-1:T/eF/+Rd+acLwvol70bJc7iAcarGQCRXCN3QP/DIPJs="
    ];
  };
}
