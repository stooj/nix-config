{...}: {
  # hrsh7th/nvim-cmp: A completion engine plugin for neovim written in Lua.
  # Completion sources are installed from external repositories and "sourced".
  # https://github.com/hrsh7th/nvim-cmp
  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      mapping = {
        "<C-h>" = "cmp.mapping.abort()";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-l>" = "cmp.mapping.confirm({ select = true })";
      };
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      sources = [
        {
          name = "buffer"; keyword_length = 3;
        }
        {
          name = "path"; keyword_length = 3;
        }
	{
	  name = "luasnip";
	}
      ];
    };
  };
}
