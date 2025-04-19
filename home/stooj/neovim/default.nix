{...}:{
  imports = [
    ./style.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
    };
  };
}
