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
}
