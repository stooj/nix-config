{ config, ... }:
{
  xdg = {
    enable = true;
    userDirs =
      let
        homeDir = config.home.homeDirectory;
      in
      {
        enable = true;
        createDirectories = true;
        desktop = "${homeDir}/desktop";
        documents = "${homeDir}/documents";
        download = "${homeDir}/downloads";
        music = "${homeDir}/music";
        pictures = "${homeDir}/pictures";
        publicShare = "${homeDir}/public";
        templates = "${homeDir}/templates";
        videos = "${homeDir}/videos";
      };
  };
}
