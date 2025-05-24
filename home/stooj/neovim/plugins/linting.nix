{ pkgs, lib, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      csslint
    ];
    plugins.lint = {
      enable = true;
      lintersByFt = {
        css = [ "csslint" ];
      };
      linters = {
        csslint.cmd = lib.getExe pkgs.csslint;
      };
    };
  };
}
