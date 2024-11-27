{ ... }:
{
  programs.gpg = {
    publicKeys = [
      {
        source = ../../keys/stooj.asc;
        trust = "ultimate";
      }
      {
        source = ../../keys/pindy.asc;
        trust = "full";
      }
    ];
  };

}
