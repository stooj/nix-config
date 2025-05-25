{ ... }:
{
  programs.nixvim = {
    diagnostic.settings = {
      virtual_lines = {
        current_line = true;
      };
    };
    extraConfigLua = ''
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
    plugins.lsp = {
      enable = true;
      servers = {
        harper_ls.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        superhtml.enable = true;
        stylelint_lsp.enable = true;
      };
    };
  };
}
