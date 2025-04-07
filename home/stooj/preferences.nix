{pkgs, ...}:{
  systemd.user.sessionVariables = {
    # Set the default terminal emulator
    TERMINAL = "${pkgs.kitty}/bin/kitty";
  };
  home.sessionVariables = {
    TERMINAL = "${pkgs.kitty}/bin/kitty";
  };
}
