{...}:{
  imports = [
    # General settings
    ./keymaps.nix
    ./settings.nix

    # Theming
    ./style/icons.nix
    ./style/theme.nix

    # Utils
    ./plugins/utils/mini.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
