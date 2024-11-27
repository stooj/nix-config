{ ... }:
{
  programs.gpg = {
    publicKeys = [
      {
        source = ../../keys/pindy.asc;
        trust = "ultimate";
      }
      {
        source = ../../keys/stooj.asc;
        trust = "full";
      }
    ];
  };
}
