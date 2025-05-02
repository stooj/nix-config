{ ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      marksman.enable = true;
      harper_ls = {
        enable = true;
        settings = {
          "[\"harper-ls\"]" = {
            linters = {
              SpellCheck = false;
            };
          };
        };
      };
    };
  };
}
