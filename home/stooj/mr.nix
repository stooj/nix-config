{ ... }:
{
  programs.mr = {
    settings = {
      "code/docs/stooj-dot-org" = {
        checkout = "git clone 'git@github.com:stooj/stooj-dot-org.git'";
      };
      "code/nix/nix-config" = {
        checkout = "git clone 'git@github.com:stooj/nix-config.git'";
      };
      "code/pulumi/higara" = {
        checkout = "git clone 'git@github.com:stooj/pulumi-higara.git' higara";
      };
    };
  };

}
