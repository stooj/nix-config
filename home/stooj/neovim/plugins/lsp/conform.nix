{ pkgs, lib, ... }:
{
  # conform.nvim
  # Lightweight yet powerful formatter plugin for Neovim
  # See https://github.com/stevearc/conform.nvim
  programs.nixvim = {
    extraPackages = with pkgs; [
      prettierd
    ];
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters = {
          nixfmt = {
            command = "${lib.getExe pkgs.nixfmt-rfc-style}";
          };
        };
        formatters_by_ft = {
          htmldjango = [ "djlint" ];
          markdown = [ "prettierd" ];
          nix = [ "nixfmt" ];
        };
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
    userCommands = {
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
      Format = {
        desc = "Format buffer with conform";
        command.__raw = ''
          function(args)
            local range = nil
            if args.count ~= -1 then
              local end_line = vim.api.nvim_buf_get_lines(0, args.lind2 - 1, args.lind2, true)[1]
              range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
              }
            end
            require("conform").format({ async = true; lsp_format = "fallback", range = range })
          end
        '';
        range = true;
      };
    };
  };
}
