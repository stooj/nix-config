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
        url = "\"query:ThisMonth:age < 31\"";
      }
    ];
  };
}
