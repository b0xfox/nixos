{ pkgs, ... }:

{
    users.users = {
        fox = {
            initialPassword = "1234";
            isNormalUser = true;
            extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" ];
        };
    };
}
