{ ... }:
{
  home.username = "stooj";
  home.homeDirectory = "/home/stooj";

  programs.home-manager.enable = true;

  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = keys/stooj.asc;
        trust = "ultimate";
      }
    ];
  };

  home.stateVersion = "24.05";
}
