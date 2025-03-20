{config, ...}: {
  sops.secrets.mysecret.sopsFile = ./secrets.yaml;
}
