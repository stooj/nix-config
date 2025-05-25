{ pkgs, lib, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      biome
      djlint
    ];
    plugins.lint = {
      enable = true;
      autoCmd.event = [
        "InsertLeave"
        "BufWinEnter"
      ];
      lintersByFt = {
        css = [ "biomejs" ];
        htmldjango = [ "djlint" ];
      };
      linters = {
        biomejs.cmd = lib.getExe pkgs.biome;
        djlint.cmd = lib.getExe pkgs.djlint;
      };
    };
  };
}
