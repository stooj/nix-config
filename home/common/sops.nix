{ config, ... }:
{
  sops = {
    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];
    defaultSopsFile = ../${config.home.username}/secrets.yaml;
  };
}
