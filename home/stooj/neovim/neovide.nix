{ ... }:
{
  programs.nixvim = {
    globals.neovide_scale_factor = 1.0;
    keymaps = [
      {
        key = "<C-+>";
        action.__raw = ''
          function()
          vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.25
          end
        '';
        mode = "n";
        options = {
          silent = true;
        };
      }
      {
        key = "<C-->";
        action.__raw = ''
          function()
          vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1/1.25
          end
        '';
        mode = "n";
        options = {
          silent = true;
        };
      }
    ];
  };
}
