{pkgs, ...}:{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+p>h" = "kitten hints --type hash --program *";
      "ctrl+shift+e" = "kitten hints --type url --program *";
    };
  };
}
