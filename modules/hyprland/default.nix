{ config, pkgs, lib, ... } @inputs : 
{
    
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;

        settings = {
            monitor = ", preferred, auto, 1";
        };
    };
}

