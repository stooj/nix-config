{ ... }:
{
  home.username = "pindy";
  home.homeDirectory = "/home/pindy";

  programs.home-manager.enable = true;

  imports = [
    ../common
    ./git.nix
    ./gpg.nix
    ./konsole.nix
    ./password-store.nix
  ];

  home.stateVersion = "24.05";
}
