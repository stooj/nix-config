{ config, ... }:
{
  programs.mr = {
    settings = {
      "${config.xdg.dataHome}/password-store" = {
        checkout = "git clone 'git@code.ginstoo.net:pindy/pass-store.git' password-store";
      };
    };
  };
}
