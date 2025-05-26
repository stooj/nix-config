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

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Utils
    ./plugins/utils/image.nix
    ./plugins/utils/lastplace.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
