{ ... }:
{
  imports = [
    # General settings
    ./settings.nix

    # Utils
    ./plugins/utils/image.nix
  ];
}
