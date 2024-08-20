{ inputs, lib, config, pkgs, ... }:

{
    imports = [
        ./config/sway.nix
        ./config/alacritty.nix
        ./config/waybar.nix
        ./modules/overlays.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
        # Workaround for https://github.com/nix-community/home-manager/issues/2942
        allowUnfreePredicate = _: true;
    };

    home = {
        username = "fox";
        homeDirectory = "/home/fox";
    };

    programs.home-manager.enable = true;
    
    # programs.hyprland.config = {
    #     # Hyprland-specific configuration
    # };

    home.stateVersion = "24.05";
}
