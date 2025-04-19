{...}:{
  imports = [
    ./style.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
    };
  };
}
