{ pkgs, ... }:

{
  # add yubikey udev packages and usb-modeswitch
  services.udev.packages =
    with pkgs; [ libu2f-host yubikey-personalization usb-modeswitch-data ];

  # add yubikey group, all uses in yubikey group can access yubikey devices
  users.extraGroups.yubikey = {};

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.pcscd.enable = true;

  services.trezord.enable = true; 

  environment.systemPackages = with pkgs; [
    gnupg
    
    # yubikey tools
    yubikey-personalization
    yubikey-personalization-gui

    # trezor tools
    python3Packages.shamir-mnemonic
    (python3.withPackages(ps: with ps; [
      trezor_agent wheel
    ]))
  ];
}