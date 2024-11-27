{ ... }:
{
  home.username = "pindy";
  home.homeDirectory = "/home/pindy";

  programs.home-manager.enable = true;

  imports = [
    ../common
    ./git.nix
    ./gpg.nix
  ];

  home.stateVersion = "24.05";
}
