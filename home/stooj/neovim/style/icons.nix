{...}:{
  programs.nixvim.plugins.mini = {
    mockDevIcons = true;
    modules = {
      icons.enable = true;
    };
  };
}
