{pkgs, config, ...}:{
  sops.secrets.nextcloud_url = {};
  sops.secrets.nextcloud_user = {};
  sops.secrets.nextcloud_password = {};

  sops.templates."nextcloud.env".content = ''
    NEXTCLOUD_USERNAME = "${config.sops.placeholder.nextcloud_user}"
    NEXTCLOUD_PASSWORD = "${config.sops.placeholder.nextcloud_password}"
    NEXTCLOUD_URL = "${config.sops.placeholder.nextcloud_url}"
  '';

  systemd.user = {
    services.nextcloud-downloads-autosync = {
      Unit = {
        Description = "Auto sync Nextcloud downloads dir";
        After = "network-online.target";
      };
      Service = {
        Type = "simple";
        EnvironmentFile = "${config.sops.templates."nextcloud.env".path}";
        ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h --user \${NEXTCLOUD_USERNAME} --password \${NEXTCLOUD_PASSWORD} --path /downloads %D/nextcloud/downloads \${NEXTCLOUD_URL}";
        TimeoutStopSec = "180";
      };
      Install.WantedBy = ["multi-user.target"];
    };
    timers.nextcloud-downloads-autosync = {
      Unit.Description = "Automatic sync download files with Nextcloud when booted up after 5 minutes then rerun every 60 minutes";
      Timer = {
        OnBootSec = "5min";
        OnUnitActiveSec = "60min";
      };
      Install.WantedBy = ["multi-user.target" "timers.target"];
    };
    startServices = true;
  };
}
