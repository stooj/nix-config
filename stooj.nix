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

  programs.mr = {
    enable = true;
    settings = {
      "code/nix/nix-config" = {
        checkout = "git clone 'git@github.com:stooj/nix-config.git'";
      };
    };
  };

  home.stateVersion = "24.05";
}
