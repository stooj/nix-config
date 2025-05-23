{ ... }:
{
  programs.nixvim.extraConfigLua = ''
      require('lspconfig').harper_ls.setup {
      settings = {
        ["harper-ls"] = {
          linters = {
            sentence_capitalization = false,
            spell_check = false
          }
        }
      }
    }
  '';
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      stylelint_lsp = {
        enable = true;
      };
      nil_ls.enable = true;
      marksman.enable = true;
      harper_ls = {
        enable = true;
      };
    };
  };
}
