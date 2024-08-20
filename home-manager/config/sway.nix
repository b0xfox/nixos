{ config, pkgs, ... }: {
  
  wayland.windowManager.sway = {

    # https://nix-community.github.io/home-manager/options.xhtml

    enable = true;
    xwayland = true;
    package = pkgs.swayfx;
    checkConfig = true;

    extraSessionCommands = "";
    extraOptions = [];
    extraConfig = "";
    extraConfigEarly = "";

    config = {

        startup = [
            { command = "systemctl --user restart waybar"; always = true; }
        ];

        # output = {
        #     HDMI-A-2 = {
        #         bg = "~/path/to/background.png fill";
        #     };
        # };

        menu = "rofi-wayland";

        terminal = "\${pkgs.alacritty}/bin/alacritty";

        modifier = "Mod4";

        left = "h";
        right = "l";
        up = "k";
        down = "j";

        # Workspaces
        defaultWorkspace = "workspace number 1"; 
        workspaceAutoBackAndForth = false;
        workspaceLayout = "default";

        modes = {
            resize = {
                Down = "resize grow height 10 px";
                Escape = "mode default";
                Left = "resize shrink width 10 px";
                Return = "mode default";
                Right = "resize grow width 10 px";
                Up = "resize shrink height 10 px";
                h = "resize shrink width 10 px";
                j = "resize grow height 10 px";
                k = "resize shrink height 10 px";
                l = "resize grow width 10 px";
            };
        };

        floating = {
            border = 2;
            criteria = [
                {
                    title = "Steam - Update News";
                }
            ];
            modifier = "sway.config.modifier";
            titlebar = true;
        };

        focus = {
            followMouse = "yes";
            wrapping = "no"; 
            mouseWarping = true;
            newWindow = "smart";
        };

        fonts = {
            names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
            style = "Bold Semi-Condensed";
            size = 16.0;
        };

        gaps = {
            top = 5;
            bottom = 5;
            left = 5;
            right = 5;
            inner = 12;
            outer = 5;
            horizontal = 5;
            vertical = 5;
            smartBorders = "off";
            smartGaps = false;
        };

        assigns = {
            "1: web" = [{ class = "^Firefox$"; }];
            "0: extra" = [{ class = "^Firefox$"; window_role = "About"; }];
        };

        #  config.keybindings = https://i3wm.org/docs/userguide.html#keybindings.
        # let
        #     modifier = config.wayland.windowManager.sway.config.modifier;
        # in lib.mkOptionDefault {
        #     "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
        #     "${modifier}+Shift+q" = "kill";
        #     "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
        # }
        
        window = {
            border = 2;
            # commands = [];
            hideEdgeBorders = "none";
            titlebar = true;
        };

        colors = {
            background = "#ffffff";
            focused = {
                background = "#285577";
                border = "#4c7899";
                childBorder = "#285577";
                indicator = "#2e9ef4";
                text = "#ffffff";
            };
            focusedInactive = {
                background = "#5f676a";
                border = "#333333";
                childBorder = "#5f676a";
                indicator = "#484e50";
                text = "#ffffff";
            };
            placeholder = {
                background = "#0c0c0c";
                border = "#000000";
                childBorder = "#0c0c0c";
                indicator = "#000000";
                text = "#ffffff";
            };
            unfocused = {
                background = "#222222";
                border = "#333333";
                childBorder = "#222222";
                indicator = "#292d2e";
                text = "#888888";
            };
            urgent = {
                background = "#900000";
                border = "#2f343a";
                childBorder = "#900000";
                indicator = "#900000";
                text = "#ffffff";
            };
        };

        bars = {
            main = {

                command = "\${pkgs.waybar}/bin/waybar";
                extraConfig = ""; 
                hiddenState = "hide";
                mode = "dock";
                position = "top";
                workspaceButtons = true;
                workspaceNumbers = true;

                fonts = {
                    names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
                    style = "Bold Semi-Condensed";
                    size = 16.0;
                };
                colors = {

                    background = "#2a2a2a";
                    statusline = "#f0f0f0";
                    separator = "#595959";

                    focusedBackground = "#000000";
                    focusedSeparator = "#666666";
                    focusedStatusline = "#ffffff";

                    activeWorkspace = {
                        background = "#5f676a";
                        border = "#333333";
                        text = "#ffffff";
                    };
                    focusedWorkspace = {
                        background = "#285577";
                        border = "#4c7899";
                        text = "#ffffff";
                    };
                    inactiveWorkspace = {
                        background = "#222222";
                        border = "#333333";
                        text = "#888888";
                    };
                    urgentWorkspace = {
                        background = "#900000";
                        border = "#2f343a";
                        text = "#ffffff";
                    };
                    bindingMode = {
                        background = "#900000";
                        border = "#2f343a";
                        text = "#ffffff";
                    };
                };
            };
        };
    };
  };
}
