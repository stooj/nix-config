{ ... }:
{
  programs.mr.settings."code/docs/wiki" = {
    checkout = "git clone 'git@code.ginstoo.net:stooj/wiki.git'";
  };
  programs.nixvim = {
    files = {
      "ftplugin/norg.lua" = {
        localOpts = {
          conceallevel = 2;
          textwidth = 0;
        };
      };
    };

    plugins.neorg = {
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
        "core.concealer" = {
          config = {
            icon_preset = "diamond";
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
  };
}
