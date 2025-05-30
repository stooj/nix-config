{
  pkgs,
  config,
  lib,
  ...
}:
{
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
          rofi = if config.programs.rofi.enable then config.programs.rofi.finalPackage else pkgs.rofi;
          rofi-pass =
            if config.programs.rofi.pass.enable then config.programs.rofi.pass.package else pkgs.rofi-pass;
        in
        lib.mkOptionDefault {
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
          "${modifier}+p" = "exec ${rofi-pass}/bin/rofi-pass";
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
      menu =
        let
          rofi = if config.programs.rofi.enable then config.programs.rofi.finalPackage else pkgs.rofi;
        in
        "${rofi}/bin/rofi -show run";
      modes = {
        resize =
          let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in
          {
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
}
