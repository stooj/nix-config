{...}:{
  imports = [
    # General settings
    ./indent.nix
    ./keymaps.nix
    ./settings.nix

    # Theming
    ./style/icons.nix
    ./style/theme.nix

    # Completion
    ./plugins/completion/cmp.nix

    # Editor plugins and configurations
    ./plugins/editor/treesitter.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Utils
    ./plugins/utils/lastplace.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
