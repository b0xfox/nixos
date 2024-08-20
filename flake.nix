{
  description = "NixOS Flake";

  # nix flake update

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Other
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland }@inputs:
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

    # home-manager switch --flake .#username@hostname
    homeConfigurations = {
        # fox@box = username@hostname
        "fox@box" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home-manager/home.nix ];
        };
    };
  };
}
