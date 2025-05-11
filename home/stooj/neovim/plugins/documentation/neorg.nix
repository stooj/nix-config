{ ... }:
{
  programs.nixvim.plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
    };
  };
}
