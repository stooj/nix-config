{ config, ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      neovim-bin = config.programs.nixvim.build.package;
    };
  };
}
