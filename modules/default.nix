{ nixosSystem, trezor_agent_recovery, system }:

(nixosSystem {
  modules = [
    ./configuration.nix

    {
      environment.systemPackages = [ trezor_agent_recovery ];
    }
  ];
  inherit system;
}).config.system.build