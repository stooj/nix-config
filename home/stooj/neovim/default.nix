{...}:{
  imports = [
    ./style.nix
  ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
    };
  };
}
