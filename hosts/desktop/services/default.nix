
{ config, pkgs, ... }:

let
  hhkbCommand = ''
    sudo /home/nekox/Downloads/evremap/target/release/evremap remap /home/nekox/Downloads/evremap/hhkb.toml
  '';

in
{
  systemd.services.hhkb = {
    description = "HHKB Service";
    serviceConfig.ExecStart = hhkbCommand;
    wantedBy = [ "multi-user.target" ];
    user = "nekox";
  };
}
