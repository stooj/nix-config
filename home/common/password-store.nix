{ ... }:
{
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_GENERATED_LENGTH = "36";
    };
  };
}
