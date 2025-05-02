{ ... }:
{
  programs.nixvim.extraConfigLua = ''
      require('lspconfig').harper_ls.setup {
      settings = {
        ["harper-ls"] = {
          linters = {
            SpellCheck = false
          }
        }
      }
    }
  '';
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      marksman.enable = true;
      harper_ls = {
        enable = true;
      };
    };
  };
}
