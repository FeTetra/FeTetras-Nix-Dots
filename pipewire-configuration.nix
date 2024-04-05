# pipewire-configuration.nix

# PipeWire configuration, this can be removed to get rid of PipeWire

{config, pkgs, ...}:

{

  #Enable PipeWire service

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    
    #JACK implementation planned

  };

}
