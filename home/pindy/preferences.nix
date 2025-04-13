{pkgs, ...}:{
  systemd.user.sessionVariables = {
    # Set the default terminal emulator
    TERMINAL = "${pkgs.konsole}/bin/konsole";
  };
  home.sessionVariables = {
    TERMINAL = "${pkgs.konsole}/bin/konsole";
  };
}
