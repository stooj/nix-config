{ ... }:
{
  programs.nixvim.plugins.neorga = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
    };
  };
}
