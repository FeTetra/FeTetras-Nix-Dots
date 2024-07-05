# user-pkgs.nix

# All packages I would like to install and configure on my system

{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    discord
    spotify
    betterdiscord-installer
    vesktop
    floorp
    firefox
    steam
    obs-studio
    smplayer
    rpcs3
    bottles
  ];

}
