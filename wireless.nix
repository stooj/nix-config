{config, ...}: {
  sops.secrets.rental-flat-psk = {};
  sops.templates."wireless.env".content = ''
    RENTAL_FLAT_PSK = "${config.sops.placeholder.rental-flat-psk}"
  '';
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [
      config.sops.templates."wireless.env".path
    ];
    profiles = {
      rental-flat = {
        connection = {
          id = "rental-flat";
          type = "wifi";
        };
        ipv4 = {
          method = "auto";
        };
        ipv6 = {
          addr-gen-mode = "default";
          method = "auto";
        };
        proxy = {};
        wifi = {
          mode = "infrastructure";
          ssid = "MIWIFI_rJdj";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "$RENTAL_FLAT_PSK";
        };
      };
    };
  };
}
