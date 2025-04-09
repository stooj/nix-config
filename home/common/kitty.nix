{pkgs, ...}:{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_pager = "vim -c 'set ft=man' -R -"; };
  };
}
