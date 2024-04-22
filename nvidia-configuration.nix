# nvidia-configuration.nix

# Hardware packages and configuration for NVIDIA GPUs

{config, pkgs, ...}: 

{

  # Bootloader
  boot = {
    initrd = {
      kernelModules = [ "nvidia" ]; 
    };
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  # NVIDIA Packages
  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    libva-utils
  ];

  # NVIDIA GPU Configuration (Using proprietary drivers)
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true; # May change this seems stupid.
    powerManagement.enable = false; # No clue what this does lolol might disable if no effect. (Have found what this does but still may disable)
  };

  # NVIDIA Services
  services.xserver.videoDrivers = [ "nvidia" ];  
  
  # NVIDIA Session Variables
  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  
}
