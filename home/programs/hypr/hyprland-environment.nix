{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
    EDITOR = "lvim";
    BROWSER = "librewolf";
    TERMINAL = "kitty";
    LIBVA_DRIVER_NAME= "iHD"; # hardware acceleration
    __GL_VRR_ALLOWED="1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    };
  };
}
