{...}:{
  programs.nixvim = {
    editorconfig.enable = true;
    opts = {
      # If a filetype doesn't have a specific indent ruleset, I want spaces to
      # be the default. Tabs are not my friend.
      # These can be overwritten by any ft indentation rules which I will
      # declare elsewhere.

      # How much should vim commands like `>>` and `<<` indent/dedent things?
      shiftwidth = 4;
      # How many 'spaces' should a tab take up?
      tabstop = 4;
      # Use spaces instead of a tab when I press the Tab key
      expandtab = true;
    };
  };
}
