{...}: {
  # `telescope.nvim` is a highly extendable fuzzy finder over lists.
  # Built on the latest awesome features from neovim core. Telescope
  # is centered around modularity, allowing for easy customization.
  # See https://github.com/nvim-telescope/telescope.nvim
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser.enable = true;
      fzf-native.enable = true;
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
	options.desc = "Find files in the working directory";
      };
      "<leader>fg" = {
        action = "live_grep";
	options.desc = "Grep for text";
      };
    };
  };
}
