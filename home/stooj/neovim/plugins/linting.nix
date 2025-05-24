{ pkgs, ... }:
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
    };
  };
}
