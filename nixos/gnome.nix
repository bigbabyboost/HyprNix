# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "intel" ];
      deviceSection = ''
        Option "DRI" "3"
        Option "TearFree" "true"
      '';
      desktopManager = {
        gnome.enable = true;
      };
      displayManager = {
        gdm.enable = true;
        autoLogin.enable = false;
      };
    };
  };

  environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];
}

