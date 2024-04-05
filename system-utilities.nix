# system-utilities.nix

# List of software utilities to install and configure

{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
  
    # ORGANIZE PLEASE #

    # Filesystem and file utilities
    wget
    unzip
    jq
    ntfsprogs
    udiskie
    udisks2
    gnome.file-roller
    parted
    gparted
    steam-run
    pavucontrol
    
    # Possible to remove later
    woeusb
    woeusb-ng  

    # CLI and Shell Utilities
    nix-search-cli
    btop
    cava 

  ];

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "fetetra" ];

}
