{ ... }:
{
  home.username = "pindy";
  home.homeDirectory = "/home/pindy";

  programs.home-manager.enable = true;

  imports = [
    ../common
    ./git.nix
  ];

  home.stateVersion = "24.05";
}
