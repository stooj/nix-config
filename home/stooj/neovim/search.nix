{...}: {
  programs.nixvim = {
    opts = {
      # Usually I want my search to be case-insensitive, so as long as the
      # whole search string is lower case, then ignore the case.
      ignorecase = true;
    };
  };
}
