{ config, lib, ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      neovim-bin = lib.getExe config.programs.nixvim.build.package;
    };
  };
}
