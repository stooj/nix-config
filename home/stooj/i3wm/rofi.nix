{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    location = "center";
    plugins = [ pkgs.rofi-emoji ];
  };
}
