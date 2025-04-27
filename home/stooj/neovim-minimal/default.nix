{ ... }:
{
  programs.nixvim = {
    enable = true;
    plugins.lsp = {
      enable = true;
      servers.marksman.enable = true;
    };
  };
}
