{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+p>h" = "kitten hints --type hash --program *";
      "ctrl+shift+e" = "kitten hints --type url --program *";
      "ctrl+shift+p>f" = "kitten hints --type path --program *";
    };
    settings = {
      cursor_trail = 2;
      cursor_trail_start_threshold = 0;
    };
    shellIntegration.enableBashIntegration = true;

    font.name = "Hurmit Nerd Font";
  };
}
