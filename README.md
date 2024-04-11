# FeTetras NixOS Dotfiles
## My personal setup of modular .nix configuration files - written by me!
### _These files will be updated when I feel like pushing to the repository. Remember, there may very well be some issues, bugs, and bloat._

These are a set of files which are used to configure software and set up a nix-environment. In this repository, I include a configuration for NVIDIA GPUs, Hyprland (a popular Wayland compositor), PipeWire, and some other arbitrary packages and utilities (arbitrary files are a bit messy at the moment...)

_Note: My personal preferences are included in the making of these files. If you use them, I would highly recommend changing some stuff. For example, I am using the beta NVIDIA drivers in my config. You may also not want Hyprland or some of the packages I have chosen to install._

## Installation
### I don't have any form of install script at the moment and I likely won't be providing one for a while.

This process should be as simple as copying the files to ```/etc/nixos```. Although it may be more ideal for you to copy the files wherever you like (aside from configuration.nix) and reference them in the ```imports``` section of your own configuration.nix.

In theory, these files should be hot-swappable. If you want an i3wm configuration, you can write one up and replace the Hyprland configuration. I only have a Hyprland config at the moment simply because that is my window manager and Wayland compositor of choice. Eventually I will take a closer look at these files and move anything that breaks modularity even if only slightly. For example having Wayland env-vars set in the NVIDIA config to fix issues with Wayland on NVIDIA. This isn't totally necessary and should be used only to fix issues on Wayland *specifically*. You wouldn't wanna have those set in an X11 environment.

In the future, I would like to write some sort of setup script that automates the process of setting up the Nix environment using my configs. For example it asks what desktop you want, what graphics hardware you have, what kinds of utilities you want, etc. Then, uses that information to grab some Nix configurations from here and copy them into place! Basically an installer... This is only an idea however, and should not be taken as direct planning for such a feature. 
