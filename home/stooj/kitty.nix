{pkgs, ...}:{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+p>h" = "kitten hints --type hash --program *";
    };
  };
}
