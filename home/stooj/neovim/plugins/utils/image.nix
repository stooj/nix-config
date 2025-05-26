{ ... }:
{
  programs.nixvim = {
    dependencies.imagemagick.enable = true;
    plugins.image.enable = true;
  };
}
