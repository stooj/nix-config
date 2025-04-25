{...}:{
  imports = [
    # General settings
    ./indent.nix
    ./keymaps.nix
    ./search.nix
    ./settings.nix

    # Theming
    ./style/icons.nix
    ./style/theme.nix

    # Completion
    ./plugins/completion/cmp.nix

    # Editor plugins and configurations
    ./plugins/editor/treesitter.nix

    # LSP and formatting
    ./plugins/lsp/fidget.nix
    ./plugins/lsp/lsp.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Utils
    ./plugins/utils/lastplace.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
