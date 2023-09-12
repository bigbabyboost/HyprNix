{ input, config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../hosts/desktop
      ../module/system/default.nix
      #./gnome.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      useOSProber = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
      theme = pkgs.stdenv.mkDerivation {
        name = "catppuccin-mocha";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
          hash = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";         
        };
        installPhase = "cp -a src/catppuccin-mocha-grub-theme $out";
      };
    };
  };

  networking.hostName = "unix";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #NvidiaConfig
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  programs.light.enable = true;
  programs.steam = {
   enable = false;
   remotePlay.openFirewall = true;
   dedicatedServer.openFirewall = true;
  };
  # Configure console keymap
  console.keyMap = "us";

  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # add /.local to $PATH
  environment.variables={
   NIXOS_OZONE_WL = "1";
   PATH = [
     "\${HOME}/.local/bin"
     "\${HOME}/.config/rofi/scripts"
   ];
   NIXPKGS_ALLOW_UNFREE = "1";
  };
  users.defaultUserShell = pkgs.zsh;
  users.users.nekox = {
    isNormalUser = true;
    description = "Nekox";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "storage" ];
    packages = with pkgs; [
      firefox
      (opera.override { proprietaryCodecs = true; })
      neofetch
      lolcat
   ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Garbage colector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.autoUpgrade = {
   enable = true;
   channel = "https://nixos.org/channels/nixos-unstable";
  };
 
  system.stateVersion = "23.05";
  
  #Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
 };
}
