# hyprland-configuration.nix

# List of packages to add and configure to make hyprland environment.

{config, pkgs, ...}: 

{
  
  programs = {
  
    # Hyprland Configuration  
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
  
    # Waybar Configuration
    waybar = {
      enable = true;
      package = pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    };
  
    # Thunar configuration
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    
  };

  # XDG Configuration
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-xapp
        pkgs.xdg-desktop-portal-shana
        pkgs.xdg-desktop-portal-hyprland
        pkgs.lxqt.xdg-desktop-portal-lxqt
      ];
    };
  };
  
  # Security Configuration
  security = {
    polkit = {
      enable = true;
    };
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };
  };
  
  #GDM Service (May swap to SDDM)
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = false;
  };
  
  # GNOME Services
  services.gnome = {
    sushi.enable = true;
    gnome-keyring.enable = true;  
  };

  # Packages to set up desktop
  environment.systemPackages = with pkgs; [
    # Hyprland Specific
    #hyprland-share-picker # Doesn't work, may have a different package, commenting out for now
    hyprland-protocols
    hyprpicker
    hyprcursor
    hyprpaper
    swayidle
    swaylock
    swaynotificationcenter
    swww
    kitty

    # Wayland Specific
    wl-clipboard
    wlr-randr
    xdg-utils
    xdg-utils-cxx
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-xapp
    xdg-desktop-portal-shana
    lxqt.xdg-desktop-portal-lxqt
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    xdg-ninja
    xdg-terminal-exec
    xorg.xrandr
    xorg.xhost
    swappy
    slurp
    grim #God I love wayland workarounds :heart_eyes:
    lxqt.lxqt-policykit
    ydotool    

    # Nwg-shell Applications
    nwg-look
    nwg-displays
    
    # UI Toolkits
    qt5.qtwayland
    qt6.qtwayland
    qt6.qmake
    adwaita-qt
    adwaita-qt6
    rofi-wayland #Says in its github repo that it's not a UI toolkit, but let's be honest...#
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    gsettings-desktop-schemas
    spacx-gtk-theme
  ];

  environment.sessionVariables = {
    
    # Graphical Environment Variables
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
    WLR_RENDERER = "vulkan";
    
    # XDG Variables
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";

    # UI Toolkit Variables
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    GTK_USE_PORTAL = "1";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Materia-Dark-Compact"; #Comment out if unavailable

    # WM Fix Variables
    _JAVA_AWT_WM_NONREPARENTING = "1";

  };

}
