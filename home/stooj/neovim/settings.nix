{...}:{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
    };

    autoCmd = [
      {
	# This autocommand remembers the position of the curser when a file is
	# closed, and navigate back to that position when the file is opened
	# again.
        command = ''if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif'';
	event = [ "BufRead" ];
	pattern = "*";
      }
    ];
  };
}
