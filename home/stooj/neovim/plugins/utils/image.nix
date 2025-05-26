{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [ imagemagick ];
    extraLuaPackages = ps: [ ps.magick ];
    plugins.image = {
      enable = true;
      settings = {
        backend = "kitty";
      };
    };
  };
}
