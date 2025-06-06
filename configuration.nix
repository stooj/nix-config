# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./bash.nix
    ./hardware-configuration.nix
    ./disks.nix
    ./fonts.nix
    ./power-management.nix
    ./vim.nix
    ./wireless.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "drummer";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Madrid";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };

  services.displayManager = {
    defaultSession = "none+i3";
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  sops.secrets = {
    pindyPasswordHash = {
      neededForUsers = true;
    };
    rootPasswordHash = {
      neededForUsers = true;
    };
    stoojPasswordHash = {
      neededForUsers = true;
    };
    stoojSSHKey = {
      owner = "stooj";
      path = "/home/stooj/.ssh/id_ed25519";
    };
    pindySSHKey = {
      owner = "pindy";
      path = "/home/pindy/.ssh/id_ed25519";
    };
  };

  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.sops.secrets.rootPasswordHash.path;

  users.users.stooj = {
    hashedPasswordFile = config.sops.secrets.stoojPasswordHash.path;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyl2Fwnxmr3J4OOP1hsZuFzQ6XTZhLx64rRhZp44GIadJqboI5YWXGdrz4XRUHNo8kFmwwfpIdtPckpVY3Yd4ksHCALofSUWCuQZy2/qX4WYwq7U7/QHfmFm41ZxFJz9eTxieVLTFBak/XCOXjAMpaqlnf7B8NmgLEd6Uv6k5Zi9UWXL86yztalsdh/aghWutv3QFqQVOv0vvuO0P6d7wFSqnh2SHZatyXFECLK6HR7KnD+7UA85DWeRSOYrSMLs5U8QE01SKtUReqTt4qiULLN7/oKEehf4wh7E5zCU5SlvDuMQiQKR0RogW9O/duhmGwtXAAUj71iDkwvnKM73PVHgX5cVJm30I5CSMwDZ4JB6Lj+lQN1Bf23hNIM0l7pSbGvCVX6Ok3gE7o+WM1iRZNEj5WowPfNRqZDMqdgCV3ffs7uNfbw4cZnHvE9/UXHT6vmAlgxzH54LMd7lJ5gEAfWpBGheJnstEduVU1+14HbcQmdk7d+7g8FOVSpjKg2R9tCv1uD7fYdGudTX4IP1gV5k9yMXV0cYOCb3wkJETBBfQ48uaPIlKfOsHuy7lVYQelPFAk8m/uoEBjMvxEAa/VJDzhmC+mUNnir6okHqwxojZqEw0x9X/9AwSTvR6HFE2KE/z45aeEBS4iLpgVYDZCGsAU/4wQbJXMj/ot4AtA3w== stooj@nanokey5"
    ];
  };

  users.users.pindy = {
    hashedPasswordFile = config.sops.secrets.pindyPasswordHash.path;
    isNormalUser = true;
    extraGroups = [ "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    elinks
    fd
    git
    nextcloud-client
    ripgrep
    tree
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  services.openssh = {
    enable = true;
    knownHosts = {
      "github.com" = {
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      };
      "code.ginstoo.net" = {
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEDrBU9TgSAg3/CzFfHGJ/Hzd2mri1IObB2Ytzmj7ix1";
      };
    };
  };

  # Sops configuration
  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };

  # Generate Man page cache for apropos
  documentation.man.generateCaches = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
