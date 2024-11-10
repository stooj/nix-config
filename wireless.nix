{config, ...}: {
  sops.secrets.rental-flat-psk = {};
  sops.templates."wireless.env".content = ''
    RENTAL_FLAT_PSK = "${config.sops.placeholder.rental-flat-psk}"
  '';
  networking.networkmanager.ensureProfiles = {
    profiles = {
      rental-flat = {
        connection = {
          id = "DIGIFIBRA-PLUS-YkPe";
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
          ssid = "DIGIFIBRA-PLUS-YkPe";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "TODO: REPLACE ME WITH SECRET";
        };
      };
    };
  };
}
