{
  disko.devices = {
    disk = {
      nvme = {
        device = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_500GB_S5NYNL0T600787F";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            efi = {
              name = "efi";
              label = "efi";
              start = "1M";
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                  "umask=0077"
                ];
              };
            };
            sys = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "lvm_pv";
                  vg = "ginstoo";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      ginstoo = {
        type = "lvm_vg";
        lvs = {
          swap = {
            size = "16G";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };
          root = {
            size = "160G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
            };
          };
          home = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
        };
      };
    };
  };
}
