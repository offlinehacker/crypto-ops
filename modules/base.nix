{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  users.users.crypto = {
    isNormalUser = true;
    description = "Crypto user";
    extraGroups = [ "wheel" "yubikey" "trezord" ];
    password = "crypto";
    uid = 1000;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    protonvpn-cli
    openvpn
    openssl
  ];
}