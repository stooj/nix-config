{
  description = "A simple NixOS flake";

  inputs = {
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOs/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, disko, home-manager, sops-nix, ... }@inputs: {
    nixosConfigurations.drummer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [inputs.sops-nix.homeManagerModules.sops];
            users.stooj = import ./home/stooj;
            users.pindy = import ./home/pindy;
          };
        }
        nixos-hardware.nixosModules.common-cpu-intel
        nixos-hardware.nixosModules.common-pc-laptop
        nixos-hardware.nixosModules.system76
        sops-nix.nixosModules.sops
        ./configuration.nix
      ];
    };
  };
}
