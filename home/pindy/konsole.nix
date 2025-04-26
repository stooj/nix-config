{ pkgs, ... }:
{
  home.packages = with pkgs; [
    konsole
  ];
}
