{pkgs, ...}:{
  systemd.user = {
    services.nextcloud-downloads-autosync = {
      Unit = {
        Description = "Auto sync Nextcloud downloads dir";
        After = "network-online.target";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h --user \${NEXTCLOUD_USERNAME} --password \${NEXTCLOUD_PASSWORD} --path /downloads %D/nextcloud/downloads \${NEXTCLOUD_URL}";
        TimeoutStopSec = "180";
      };
      Install.WantedBy = ["multi-user.target"];
    };
  };
}
