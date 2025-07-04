{ ... }:
{
  programs.nixvim = {
    plugins.image = {
      enable = true;
      settings = {
        backend = "kitty";
        integrations = {
          neorg.enabled = true;
        };
      };
    };
  };
}
