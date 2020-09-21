{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
    libinput.enable = true;
  };

  # sound support
  hardware.pulseaudio.enable = true;

  # networking support
  networking.networkmanager.enable = true;

  # power managment support
  powerManagement.enable = true;

  # printing support
  services.printing = {
    enable = true;

    drivers = [ pkgs.hplipWithPlugin ];
  };

  # enable selected gnome packages
  services.gnome3.core-utilities.enable = false;
  programs.gnome-terminal.enable = true;
  programs.file-roller.enable = true;
  programs.evince.enable = true;
  programs.gnome-disks.enable = true;

  environment.systemPackages = with pkgs; with gnome3; [
    gparted
    firefox
    tor-browser-bundle-bin
    baobab
    eog
    gedit
    nautilus
    libreoffice
    protonvpn-gui
    gnome-clocks
    gnome-calculator
    gnome-system-monitor
    gnome-screenshot
  ];

  # Let nautilus find extensions
  environment.sessionVariables.NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-3.0";

  environment.pathsToLink = [
    "/share/nautilus-python/extensions"
  ];
}