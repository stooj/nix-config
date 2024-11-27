{ ... }:
{
  programs.gpg = {
    publicKeys = [
      {
        source = ../../keys/pindy.asc;
        trust = "ultimate";
      }
    ];
  };
}
