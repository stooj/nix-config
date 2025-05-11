{ ... }:
{
  programs.nixvim = {
    files = {
      "ftplugin/markdown.lua" = {
        localOpts = {
          conceallevel = 2;
          textwidth = 0;
          wrap = true;
          breakindent = true;
          breakindentopt = "shift:2";
          linebreak = true;
        };
      };
    };
  };
}
