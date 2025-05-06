{ pkgs, lib, ... }:
{
  programs.qutebrowser = {
    enable = true;
    settings.editor = {
      command = [
        "${lib.getExe pkgs.neovide}"
        "--no-fork"
        "{}"
      ];
    };
    keyBindings = {
      normal = {
        "yr" = "yank inline `{title} <{url}>`_";
        "yv" = "yank inline [[{url}|{title}]]";
      };
    };
    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      archwiki = "https://wiki.archlinux.org/index.php?search={}";
      bashfaq = "http://mywiki.wooledge.org/BashGuide?action=fullsearch&titlesearch=0&value={}&context=180";
      define = "https://en.wiktionary.org/w/index.php?search={}";
      duck = "https://duckduckgo.com/?q={}";
      gmap = "http://maps.google.com/?q={}";
      map = "https://www.openstreetmap.org/search?query={}";
      man = "https://man.archlinux.org/search?q={}&go=Go";
      nixoption = "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
      nixpkg = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
      nixwiki = "https://nixos.wiki/index.php?search={}&go=Go";
      pacman = "https://www.archlinux.org/packages/?q={}";
      vimext = "https://vimawesome.com/?q={}";
      wiki = "https://en.wikipedia.org/w/index.php?search={}";
      youtube = "https://www.youtube.com/results?search_query={}";
    };
  };

}
