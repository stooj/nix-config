{...}: {
  programs.nixvim = {
    opts = {
      # Usually I want my search to be case-insensitive, so as long as the
      # whole search string is lower case, then ignore the case.
      ignorecase = true;
      # If my search string contains a capital letter, make the search case-sensitive
      smartcase = true;
      # Make replacements default to global ones (all matches on a line).
      # To make it not-global, add a `/g` to the end of the replace command.
      gdefault = true;
      # Show the effects of `:substitute`, `:smagic`, `:snomagic`, and user
      # commands with the `command-preview` flag as you type in a split.
      inccommand = "split";
    };
  };
}
