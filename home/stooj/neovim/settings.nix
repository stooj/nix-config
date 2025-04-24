{...}:{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
      # Undo history will be stored in "$HOME/.local/state/nvim/undo"
      undofile = true;
      # Open splits below or to the right of the current window.
      splitbelow = true;
      splitright = true;
      # If a filetype doesn't have a specific indent ruleset, I want spaces to
      # be the default. Tabs are not my friend.
      # These can be overwritten by any ft indentation rules which I will
      # declare elsewhere.

      # How much should vim commands like `>>` and `<<` indent/dedent things?
      shiftwidth = 4;
    };

    autoCmd = [
      {
	desc = "Disable undo file for sensitive files";
        command = "setlocal noundofile";
	event = [ "BufWritePre" ];
	pattern = [
	  "/dev/shm/pass*"
	  "*/.git/COMMIT_EDITMSG"
	  "/tmp/*"
	];
      }
      {
	desc = "Resize vim splits if window is resized";
	command = ":wincmd =";
	event = [ "VimResized" ];
	pattern = "*";
      }
    ];
  };
}
