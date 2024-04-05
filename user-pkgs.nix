# user-pkgs.nix

# All packages I would like to install and configure on my system

{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    discord
    betterdiscord-installer
    vesktop
    floorp
    steam
    obs-studio
  ];

}
