{pkgs, config, ...}: let
  ncService = directory: {
    Unit = {
      Description = "Auto sync Nextcloud ${directory} dir";
      After = ["network-online.target" "sops-nix.service"];
    };
    Service = {
      Type = "simple";
      EnvironmentFile = "${config.sops.templates."nextcloud.env".path}";
      ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h --user \${NEXTCLOUD_USERNAME} --password \${NEXTCLOUD_PASSWORD} --path /${directory} %h/${directory} \${NEXTCLOUD_URL}";
      TimeoutStopSec = "180";
    };
    Install.WantedBy = ["multi-user.target"];
  };
  ncTimer = directory: {
    Unit.Description = "Automatic sync ${directory} files with Nextcloud when booted up after 5 minutes then rerun every 60 minutes";
    Timer = {
      OnBootSec = "5min";
      OnUnitActiveSec = "60min";
    };
    Install.WantedBy = ["multi-user.target" "timers.target"];
  };
in {
  sops.secrets.nextcloud_url = {};
  sops.secrets.nextcloud_user = {};
  sops.secrets.nextcloud_password = {};

  sops.templates."nextcloud.env".content = ''
    NEXTCLOUD_USERNAME = "${config.sops.placeholder.nextcloud_user}"
    NEXTCLOUD_PASSWORD = "${config.sops.placeholder.nextcloud_password}"
    NEXTCLOUD_URL = "${config.sops.placeholder.nextcloud_url}"
  '';

  systemd.user = {
    
    services = {
      nextcloud-backups-autosync = ncService "backups";
      nextcloud-documents-autosync = ncService "documents";
      nextcloud-downloads-autosync = ncService "downloads";
      nextcloud-music-autosync = ncService "music";
      nextcloud-pictures-autosync = ncService "pictures";
      nextcloud-tmp-autosync = ncService "tmp";
      nextcloud-videos-autosync = ncService "videos";
    };
    timers = {
      nextcloud-backups-autosync = ncTimer "backups";
      nextcloud-documents-autosync = ncTimer "documents";
      nextcloud-downloads-autosync = ncTimer "downloads";
      nextcloud-music-autosync = ncTimer "music";
      nextcloud-pictures-autosync = ncTimer "pictures";
      nextcloud-tmp-autosync = ncTimer "tmp";
      nextcloud-videos-autosync = ncTimer "videos";
    };
    startServices = true;
  };
}
