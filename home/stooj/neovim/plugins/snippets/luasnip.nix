{ ... }:
{
  home.file.".config/nvim/snippets/markdown.lua".source = ../../files/snippets/markdown.lua;
  # Snippet Engine for Neovim written in Lua
  # See https://github.com/L3MON4D3/LuaSnip
  programs.nixvim.plugins.luasnip = {
    enable = true;
    fromLua = [
      { }
      {
        paths = "~/.config/nvim/snippets";
      }
    ];
  };
}
