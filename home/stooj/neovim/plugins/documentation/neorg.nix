{ ... }:
{
  programs.nixvim.plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.completion" = {
        config = {
          engine = "nvim-cmp";
        };
      };
    };
  };
}
