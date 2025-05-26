{ ... }:
{
  imports = [
    # General settings
    ./settings.nix

    # Completion
    ./plugins/completion/cmp.nix

    # Editor plugins and configurations
    ./plugins/editor/treesitter.nix

    # Documentation
    ./plugins/documentation/neorg.nix

    # Utils
    ./plugins/utils/image.nix
  ];
}
