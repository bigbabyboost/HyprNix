{ hyprland, pkgs, ...}: {

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "nekox";
    homeDirectory = "/home/nekox";
  };

  home.packages = (with pkgs; [
    
    #User Apps
    #celluloid
    #discord
    #librewolf
    cool-retro-term
    bibata-cursors
    #vscode
    #lollypop
    #lutris
    #openrgb
    #betterdiscord-installer
    

    #utils
    ranger
    wlr-randr
    #git
    #gnumake
    #catimg
    curl
    #appimage-run
    xflux
    dunst
    pavucontrol

    #misc 
    #cava
    neovim
    nano
    rofi
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    exa
    btop

  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    gedit
  ]);

  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.stateVersion = "23.05";
}
