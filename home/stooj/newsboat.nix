{ pkgs, lib, ... }:
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
      bind-key \ macro-prefix

      # External tools
      browser "TERM=xterm-256color ${lib.getExe pkgs.elinks}"
      macro q set browser "${lib.getExe pkgs.qutebrowser}"; open-in-browser; set browser "TERM=xterm-256color ${lib.getExe pkgs.elinks}"
    '';
    urls = [
      {
        url = "https://vhyrro.github.io/rss.xml";
        title = "Vhyrro's Digital Garden";
        tags = [
          "lua"
          "neovim"
          "neorg"
          "lux"
          "luarocks"
          "development"
        ];
      }
      {
        url = ''"query:This Month:age < 31"'';
      }
      {
        url = ''"query:Breaking news:age < 2"'';
      }
    ];
  };
}
