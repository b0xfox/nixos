{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        # Desktop
        rofi-wayland
        waybar
        grim
        slurp
        
        # CLI
        git
        ranger
        ripgrep
        fzf
        fastfetch
        gotop
        zip
        unzip

        # Editors
        nano
        neovim
        kakoune
        emacs

        # Apps
        brave
        firefox
        discord
        obs-studio
        gimp
        audacity
        obsidian
        blockbench
        prismlauncher

        # Media
        mpv
        feh
        # youtube-dl

        # Dev
        godot_4
        unityhub
        python3
        # rustup
        # rustc
        # cargo
    ];
}
