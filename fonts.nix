{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.hurmit
  ];
}
