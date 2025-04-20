{...}: {
  # folke/which-key.nvim: 💥 Create key bindings that stick.
  # WhichKey is a lua plugin for Neovim 0.5 that displays a popup with
  # possible keybindings of the command you started typing.
  # https://github.com/folke/which-key.nvim
  programs.nixvim.plugins.which-key = {
    enable = true;
  };
}
