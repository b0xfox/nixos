{ inputs, lib, config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./modules/grub.nix
        ./modules/kernel.nix
        ./modules/display-manager.nix
        ./modules/sway.nix
        ./modules/nix-settings.nix
        ./modules/garbage-collector.nix
        ./modules/nixpkgs.nix
        ./modules/overlays.nix
        ./modules/locale.nix
        ./modules/env.nix
        ./modules/sound.nix
        ./modules/bluetooth.nix
        ./modules/opengl.nix
        ./modules/nvidia.nix
        ./modules/networking.nix
        ./modules/fonts.nix
        ./modules/users.nix
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05";
}
