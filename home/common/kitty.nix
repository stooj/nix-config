{pkgs, ...}:{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_pager = "${pkgs.vim_configurable}/bin/vim -c 'set ft=man' -R -"; };
  };
}
