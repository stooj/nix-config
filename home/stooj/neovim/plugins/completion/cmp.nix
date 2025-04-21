{...}: {
  # hrsh7th/nvim-cmp: A completion engine plugin for neovim written in Lua.
  # Completion sources are installed from external repositories and "sourced".
  # https://github.com/hrsh7th/nvim-cmp
  programs.nixvim.plugins.cmp = {
    enable = true;
    settings.sources = [
      { name = "buffer"; }
    ];
  };
}
