{ config, ... }:
{
  xdg = {
    enable = true;
    userDirs = let
      homeDir = config.home.homeDirectory;
    in {
      enable = true;
      createDirectories = true;
      desktop = "${homeDir}/desktop";
      documents = "${homeDir}/documents";
    };
  };
}
