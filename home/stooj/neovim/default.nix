{ ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    opts = {
      number = true;
      relativenumber = true;
    };
    plugins.image = {
      enable = true;
      settings.backend = "kitty";
    };
  };
}
