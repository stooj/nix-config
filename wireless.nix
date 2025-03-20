{config, ...}: {
  sops.secrets.rental-flat-psk = {};
  sops.secrets.ceres-hotspot-psk = {};
  sops.secrets.coworking-ssid = {};
  sops.secrets.coworking-psk = {};
  sops.templates."wireless.env".content = ''
    RENTAL_FLAT_PSK = "${config.sops.placeholder.rental-flat-psk}"
    CERES_HOTSPOT_PSK = "${config.sops.placeholder.ceres-hotspot-psk}"
    COWORKING_SSID = "${config.sops.placeholder.coworking-ssid}"
    COWORKING_PSK = "${config.sops.placeholder.coworking-psk}"
  '';
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [
      config.sops.templates."wireless.env".path
    ];
    profiles = {
      ceres-hotspot = {
        connection = {
          id = "ceres-hotspot";
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
          ssid = "ceres";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "$CERES_HOTSPOT_PSK";
        };
      };
      coworking = {
        connection = {
          id = "coworking";
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
          ssid = "$COWORKING_SSID";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "$COWORKING_PSK";
        };
      };
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
          ssid = "MOVISTAR_2749";
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
