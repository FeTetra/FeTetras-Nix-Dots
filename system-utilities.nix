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
    #gnome.file-roller
    parted
    gparted
    steam-run
    pavucontrol
    okteta   
    mpv 

    # Possible to remove later
    woeusb
    woeusb-ng  

    # CLI and Shell Utilities
    nix-search-cli
    btop
    cava
    git

    # Script langs
    python3Full
    zig
    jdk21    

    # Lang libs
    python312Packages.leb128
    python312Packages.pyside6

    # Polkit Requisites
    xorg.xhost
    xorg.xauth 

  ];

  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
  #users.extraGroups.vboxusers.members = [ "fetetra" ];

}
