{ ... }:
{
  powerManagement.enable = true;

  boot.kernelParams = [ "resume=/dev/mapper/ginstoo-swap" ];
}
