{ config, ... }:
{
  programs.mr = {
    settings = {
      "${config.xdg.dataHome}/password-store" = {
        checkout = "git clone 'git@code.ginstoo.net:stooj/pass-store.git' password-store";
      };
    };
  };
}
