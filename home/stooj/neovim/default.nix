{ ... }:
{
  imports = [
    # General settings
    ./settings.nix

    # Completion
    ./plugins/completion/cmp.nix

    # Editor plugins and configurations
    ./plugins/editor/treesitter.nix

    # Utils
    ./plugins/utils/image.nix
  ];
}
