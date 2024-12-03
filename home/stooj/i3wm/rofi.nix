{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    location = "center";
    pass = {
      enable = true;
    };
    plugins = [ pkgs.rofi-emoji ];
  };
}
