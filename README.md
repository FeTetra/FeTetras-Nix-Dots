# FeTetras NixOS Dotfiles
## My personal setup of modular .nix congiguration files - written by me!
### _These files will be updated when I feel like pushing to the repository. Remember, there may very well be some issues, bugs, and bloat._

These are a set of files which are used to configure software and set up a nix-environment. In this repository, I include a configuration for NVIDIA GPUS, Hyprland (a popular Wayland compositor), PipeWire, and some other arbitrary packages and utilites (arbitrary files are a bit messy at the moment...)

_Note: My personal preferences are included in the making of these files. If you use them, I would highly reccommend changing some stuff. For example, I am using the beta NVIDIA drivers in my config. You may also not want Hyprland or some of the packages I have chosen to install._

## Installation
This process should be as simple as copying the files to ```/etc/nixos```. Although it may be more ideal for you to copy the files wherever you like (aside from configuration.nix) and reference them in the ```imports``` section of your own configuration.nix.

### I dont have any form of install script at the moment and I likely wont be providing one for a while.
