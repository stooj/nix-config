{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.libnotify  # Needed for flameshot tool
  ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        drawThickness = 3;
        filenamePattern = "%F_%H-%M-%S";
        saveAsFileExtension = "png";
        savePath = "${config.home.homeDirectory}/pictures/screenshots";
        savePathFixed = true;
        showHelp = false;
        startupLaunch = false;
      };
    };
  };

  # Workaround for Failed to restart syncthingtray.service: Unit tray.target not found.
  # - https://github.com/nix-community/home-manager/issues/2064
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  xsession.windowManager.i3.config.keybindings = 
    let
      modifier = config.xsession.windowManager.i3.config.modifier;
    in {
      # Screenshots
      ## Screenshot of the whole screen
      "Print" = "exec flameshot full";
      ## Screenshot with a selection window
      "${modifier}+Print" = "exec flameshot gui";
      ## Screenshot with a selection window and a delay
      "${modifier}+Shift+Print" = "exec ${pkgs.writeShellScript "delayed-screenshot-selection" ''
        #!/bin/sh

        for i in $(seq 5 -1 1); do
          ${pkgs.libnotify}/bin/notify-send "Taking screenshot in $i"
          sleep 1
          ${pkgs.dunst}/bin/dunstctl close
        done

        flameshot gui
      ''}";
    };
}
