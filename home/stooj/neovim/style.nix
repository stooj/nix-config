{...}: {
  programs.nixvim = {
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        dim_inactive = true;
      };
    };
  };
}
