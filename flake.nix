{
  description = "NixOS Flake";

  # nix flake update

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

  };

  outputs = { self, nixpkgs, }@inputs:
  let
    inherit (self) outputs;
  in
  {
    # nixos-rebuild switch --flake .
    # nixos-rebuild switch --flake .#hostname
    nixosConfigurations = {
        # box = hostname
        box = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
            modules = [ ./configuration.nix ];
        };
    };
    
  };
}
