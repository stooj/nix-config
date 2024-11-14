{ ... }:
{
  home.username = "stooj";
  home.homeDirectory = "/home/stooj";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "scj@stooj.org";
    userName = "stoo johnston";
  };

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
