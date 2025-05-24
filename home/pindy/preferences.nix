{ pkgs, ... }:
{
  systemd.user.sessionVariables = {
    # Set the default terminal emulator
    TERMINAL = "${pkgs.kdePackages.konsole}/bin/konsole";
  };
  home.sessionVariables = {
    TERMINAL = "${pkgs.kdePackages.konsole}/bin/konsole";
  };
}
