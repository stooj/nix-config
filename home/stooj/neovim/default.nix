{...}:{
  imports = [
    # General settings
    ./settings.nix

    # Theming
    ./style/theme.nix

    # Utils
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
