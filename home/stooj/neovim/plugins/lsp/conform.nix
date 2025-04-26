{...}: {
# conform.nvim
# Lightweight yet powerful formatter plugin for Neovim
# See https://github.com/stevearc/conform.nvim
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = ''
        function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "fallback "}, on_format
        end
      '';
    };
  };
  programs.nixvim.userCommands = {
    FormatDisable = {
      bang = true;
      desc = "Disable autoformat-on-save";
      command.__raw = ''
        function(args)
          if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end
      '';
    };
    FormatEnable = {
      desc = "Re-enable autoformat-on-save";
      command.__raw = ''
        function(args)
          vim.b.disable_autoformat = false;
          vim.g.disable_autoformat = false;
        end
      '';
    };
  };
}
