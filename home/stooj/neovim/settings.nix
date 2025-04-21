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
