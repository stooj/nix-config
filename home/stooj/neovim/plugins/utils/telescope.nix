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
	options.desc = "Fuzzy [f]ind [f]iles in the working directory";
      };
      "<leader>fg" = {
        action = "live_grep";
	options.desc = "Fuzzy [f]ind with [g]rep";
      };
      "<leader>f/" = {
      	action = "current_buffer_fuzzy_find";
	options.desc = "Fuzzy [f]ind in the current buffer";
      };
      "<leader>fb" = {
        action = "buffers";
	options.desc = "Fuzzy [f]ind open [b]uffers";
      };
      "<leader>fk" = {
        action = "keymaps";
	options.desc = "Fuzzy [f]ind [k]eymap bindings";
      };
      "<leader>fh" = {
        action = "help_tags";
	options.desc = "Fuzzy [f]ind [h]elp topics";
      };
      "<leader>f*" = {
        action = "grep_string";
	options.desc = "Fuzzy [f]ind word under cursor";
      };
      "<leader>fo" = {
        action = "oldfiles";
	options.desc = "Fuzzy [f]ind [o]ld files";
      };
      "<leader>f:" = {
        action = "commands";
	options.desc = "Fuzzy [f]ind [:] commands";
      };
      "<leader>f:h" = {
        action = "command_history";
	options.desc = "Fuzzy [f]ind [:] command [h]istory";
      };
      "<leader>f/h" = {
        action = "search_history";
	options.desc = "Fuzzy [f]ind [/] search [h]istory";
      };
    };
  };
}
