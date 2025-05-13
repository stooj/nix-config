{ ... }:
{
  home.username = "stooj";
  home.homeDirectory = "/home/stooj";

  programs.home-manager.enable = true;

  imports = [
    ../common
    ./git.nix
    ./gpg.nix
    ./i3wm
    ./kitty.nix
    ./mr.nix
    ./neovim
    ./neovide.nix
    ./newsboat.nix
    ./password-store.nix
    ./preferences.nix
    ./qutebrowser.nix
    ./readline.nix
  ];

  home.stateVersion = "24.05";
}
