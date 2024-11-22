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
          "${modifier}+o" = "split h";
          "${modifier}+Shift+H" = "move left";
          "${modifier}+Shift+J" = "move down";
          "${modifier}+Shift+K" = "move up";
          "${modifier}+Shift+L" = "move right";
          # {,un}pin a floating window
          "${modifier}+Shift+P" = "sticky toggle";
      };
      modes = {
        resize = let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in {
          "Left" = "resize shrink width 10 px or 10 ppt";
          "h" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";
          "Escape" = "mode default";
          "Return" = "mode default";
          "${modifier}+r" = "mode default";
        };
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
