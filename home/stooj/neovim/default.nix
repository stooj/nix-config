{...}:{
  imports = [
    # General settings
    ./keymaps.nix
    ./settings.nix

    # Theming
    ./style/icons.nix
    ./style/theme.nix

    # Completion
    ./plugins/completion/cmp.nix

    # Utils
    ./plugins/utils/lastplace.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
