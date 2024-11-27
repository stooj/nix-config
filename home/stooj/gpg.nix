{ ... }:
{
  programs.gpg = {
    publicKeys = [
      {
        source = ../../keys/stooj.asc;
        trust = "ultimate";
      }
    ];
  };

}
