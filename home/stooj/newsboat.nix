{ ... }:
{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadTime = 30;
    extraConfig = ''
      # Unbind default keys that would conflict with vi-mode
      unbind-key ENTER
      unbind-key j
      unbind-key k
      unbind-key J
      unbind-key K

      # bind keys - vi style
      bind-key j down
      bind-key k up
      bind-key l open
      bind-key h quit
    '';
  };
}
