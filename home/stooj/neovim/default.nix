{ ... }:
{
  imports = [
    # General settings
    ./settings.nix

    # Editor plugins and configurations
    ./plugins/editor/treesitter.nix

    # Utils
    ./plugins/utils/image.nix
  ];
}
