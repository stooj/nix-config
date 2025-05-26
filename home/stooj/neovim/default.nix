{ ... }:
{
  imports = [
    # General settings
    ./indent.nix
    ./keymaps.nix
    ./search.nix
    ./settings.nix

    # Filetype-specific settings
    ./filetypes/markdown.nix

    # Gui settings
    ./neovide.nix

    # Theming
    ./style/icons.nix
    ./style/theme.nix

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
