{ config, pkgs, ... }:

{
  home.file.".config/wezterm/wezterm.lua".source = ./wezterm.lua;
  home.file.".config/wezterm/colors/Catppuccin.toml".source = ./colors/Catppuccin.toml;
  home.file.".config/wezterm/icon/wezterm.icns".source = ./icon/wezterm.icns;
}
