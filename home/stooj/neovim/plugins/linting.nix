{ pkgs, lib, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      biome
    ];
    plugins.lint = {
      enable = true;
      autoCmd.event = [
        "InsertLeave"
        "BufWinEnter"
      ];
      lintersByFt = {
        css = [ "biomejs" ];
      };
      linters = {
        biomejs.cmd = lib.getExe pkgs.biome;
      };
    };
  };
}
