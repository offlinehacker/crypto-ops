{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #whirlpool-gui
    wasabiwallet
    electrum
    exodus
  ];
}