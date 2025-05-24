{ pkgs, lib, ... }:
{
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        css = [ "stylelint" ];
      };
      linters = {
        stylelint = {
          cmd = "${lib.getExe pkgs.stylelint}";
        };
      };
    };
  };
}
