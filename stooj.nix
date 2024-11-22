{ pkgs, config, lib, ... }:
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

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      keybindings =
        let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
      };
      modifier = "Mod4";
      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };

  home.stateVersion = "24.05";
}
