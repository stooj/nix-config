{ pkgs, lib, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      biome
    ];
    plugins.lint = {
      enable = true;
      lintersByFt = {
        css = [ "biomejs" ];
      };
      linters = {
        biomejs.cmd = lib.getExe pkgs.biome;
      };
    };
  };
}
