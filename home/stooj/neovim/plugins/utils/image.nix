{ ... }:
{
  programs.nixvim = {
    dependencies.imagemagick.enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    plugins.image.enable = true;
  };
}
