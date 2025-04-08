{pkgs, ...}:{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_pager = "${pkgs.vim}/bin/vim -c 'set ft=man' -R -"; };
  };
}
