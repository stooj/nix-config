{ ... }:
{
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ../../keys/stooj.asc;
        trust = "ultimate";
      }
    ];
  };

}
