{ ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      dprint.enable = true;
      nil_ls.enable = true;
      marksman.enable = true;
      harper_ls = {
        enable = true;
        settings = {
          harper_ls = {
            linters = {
              sentence_capitalization = false;
              spell_check = false;
            };
          };
        };
      };
    };
  };
}
