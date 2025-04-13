{pkgs, ...}:{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+p>h" = "kitten hints --type hash --program *";
      "ctrl+shift+e" = "kitten hints --type url --program *";
      "ctrl+shift+p>f" = "kitten hints --type path --program *";
    };
    shellIntegration.enableBashIntegration = true;
  };
}
