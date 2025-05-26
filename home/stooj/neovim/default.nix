{ ... }:
{
  imports = [
    # General settings
    ./settings.nix

    # Documentation
    ./plugins/documentation/neorg.nix

    # Utils
    ./plugins/utils/image.nix
  ];
}
