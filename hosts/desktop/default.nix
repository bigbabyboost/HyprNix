{ config, lib, pkgs, ... }:
{
  imports = [
    ./fonts
    #./virtualisation
  ];

  programs.regreet.enable = false;
  services.greetd = {
    enable = false;
    settings = {
      initial_session = {
        user = "nekox";
        command = "$SHELL -l";
      };
    };
  };

  programs = {
    bash = {
      interactiveShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
        fi
      '';
    };
  };

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
