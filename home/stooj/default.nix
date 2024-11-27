{ pkgs, config, lib, ... }:
{
  home.username = "stooj";
  home.homeDirectory = "/home/stooj";

  programs.home-manager.enable = true;

  imports = [
    ../common
    ./git.nix
    ./gpg.nix
    ./password-store.nix
    ./readline.nix
  ];

  programs.mr = {
    settings = {
      "code/docs/stooj-dot-org" = {
        checkout = "git clone 'git@github.com:stooj/stooj-dot-org.git'";
      };
      "code/nix/nix-config" = {
        checkout = "git clone 'git@github.com:stooj/nix-config.git'";
      };
    };
  };

  programs.qutebrowser = {
    enable = true;
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

  programs.rofi = {
    enable = true;
    location = "center";
    plugins = [ pkgs.rofi-emoji ];
  };

  services.dunst = {
    enable = true;
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      bars = [
        {
          mode = "dock";
          hiddenState = "hide";
          position = "top";
          workspaceButtons = true;
          workspaceNumbers = true;
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = [ "monospace" ];
            size = 8.0;
          };
          trayOutput = "primary";
        }
      ];
      defaultWorkspace = "workspace number 1";
      focus.followMouse = false;
      keybindings =
        let
          modifier = config.xsession.windowManager.i3.config.modifier;
          rofi = if config.programs.rofi.enable then
                    config.programs.rofi.finalPackage
                 else pkgs.rofi;
        in lib.mkOptionDefault {
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+o" = "split h";
          "${modifier}+Shift+H" = "move left";
          "${modifier}+Shift+J" = "move down";
          "${modifier}+Shift+K" = "move up";
          "${modifier}+Shift+L" = "move right";
          # {,un}pin a floating window
          "${modifier}+Shift+P" = "sticky toggle";
          # Other rofi launchers
          "${modifier}+Shift+D" = "exec ${rofi}/bin/rofi -show drun";
          "${modifier}+Shift+S" = "exec ${rofi}/bin/rofi -show emoji -modi emoji";
          # Exit menu
          "${modifier}+Shift+e" = "exec ${pkgs.writeShellScript "exit_menu" ''
            #!/bin/sh

            select=$(echo "Cancel|Logout|Shutdown|Reboot" | rofi -sep '|' -dmenu -i -matching fuzzy -p "Are you sure you want to logout?")
            [ "$select" = "Cancel" ] && exit 0
            [ "$select" = "Shutdown" ] && systemctl poweroff && exit 0
            [ "$select" = "Reboot" ] && systemctl reboot && exit 0
            [ "$select" = "Logout" ] && i3-msg exit
            exit 0
          ''}";
          # Control notifications
          ## Close notification
          "Control+space" = "exec ${pkgs.dunst}/bin/dunstctl close";
          ## Close all notification
          "Control+Shift+space" = "exec ${pkgs.dunst}/bin/dunstctl close-all";
          ## Show last message
          "Control+grave" = "exec ${pkgs.dunst}/bin/dunstctl history-pop";
          # Screenshots
          ## Screenshot of the whole screen
          "Print" = "exec flameshot full";
          ## Screenshot with a selection window
          "${modifier}+Print" = "exec flameshot gui";
          ## Screenshot with a selection window and a delay
          "${modifier}+Shift+Print" = "exec ${pkgs.writeShellScript "delayed-screenshot-selection" ''
            #!/bin/sh

            for i in $(seq 5 -1 1); do
              ${pkgs.libnotify}/bin/notify-send "Taking screenshot in $i"
              sleep 1
              ${pkgs.dunst}/bin/dunstctl close
            done

            flameshot gui
          ''}";
      };
      menu = let
        rofi = if config.programs.rofi.enable then
                 config.programs.rofi.finalPackage
               else pkgs.rofi;
        in
          "${rofi}/bin/rofi -show run";
      modes = {
        resize = let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in {
          "Left" = "resize shrink width 2 px or 2 ppt";
          "h" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 2 px or 2 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 2 px or 2 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 2 px or 2 ppt";
          "l" = "resize grow width 10 px or 10 ppt";
          "Escape" = "mode default";
          "Return" = "mode default";
          "${modifier}+r" = "mode default";
        };
      };
      modifier = "Mod4";
      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };

  home.stateVersion = "24.05";
}
