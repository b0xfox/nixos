{ config, pkgs, ... }:

{
    nix.settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";

        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
    };
}
