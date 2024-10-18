{...}: {
  networking.networkmanager.ensureProfiles = {
    profiles = {
      DIGIFIBRA-PLUS-YkPe = {
        connection = {
          id = "DIGIFIBRA-PLUS-YkPe";
          type = "wifi";
          uuid = "a7f75602-e5ce-464f-8b50-2e459b0be9a7";
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
