{pkgs, ...}:
let
  vim-ansi-esc = pkgs.vimUtils.buildVimPlugin {
    name = "vim-plugin-AnsiEsc";
    src = pkgs.fetchFromGitHub {
      owner = "powerman";
      repo = "vim-plugin-AnsiEsc";
      rev = "690f820d20b6e3a79ba20499874eb7333aa4ca5c";
      sha256 = "sha256-N7UVzk/XUX76XcPHds+lLMZzO7gahj/9LIfof2BPThc=";
    };
  };
in {
  environment.variables = {
    EDITOR = "vim";
  };
  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { }).customize{
      name = "vim";
      vimrcConfig = {
        packages.myplugins = with pkgs.vimPlugins; {
          start = [ vim-ansi-esc ];
          opt = [];
        };
        customRC = ''
          syntax on
          set number
        '';
      };
    })
  ];
}
