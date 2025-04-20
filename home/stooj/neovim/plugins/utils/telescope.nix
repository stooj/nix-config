{...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser.enable = true;
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
	options.desc = "Find files in the working directory";
      };
    };
  };
}
