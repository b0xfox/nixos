{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        git
        wayland
        wayland-protocols
        xdg-desktop-portal-gtk
        xdg-utils
        neovim
        # waybar
        # rofi-wayland
        # dunst
    ];
}
