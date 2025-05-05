{ pkgs, lib, ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      neovim-bin = "${lib.getExe pkgs.neovim}";
    };
  };
}
