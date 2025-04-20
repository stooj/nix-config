{...}:{
  imports = [
    # General settings
    ./settings.nix

    # Theming
    ./style.nix

    # Utils
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix
  ];
}
