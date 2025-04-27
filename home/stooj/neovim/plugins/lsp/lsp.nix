{ pkgs, lib, ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers.nil_ls.enable = true;
    servers.marksman.enable = true;
    servers.marksman.cmd = [
      "${lib.getExe pkgs.marksman}"
      "server"
      "-v 1"
    ];
    servers.marksman.extraOptions.offset_encoding = "utf-8";
  };
}
