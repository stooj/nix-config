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
      "core.dirman" = {
        config = {
          workspaces = {
            wiki = "~/code/docs/wiki";
          };
          default_workspace = "wiki";
        };
      };
    };
  };
}
