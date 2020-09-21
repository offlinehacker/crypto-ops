{
    description = "crypto-ops";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
    };

    outputs = { self, nixpkgs }: let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell.${system} = with pkgs; mkShell {
        buildInputs = [
          python3
          python3Packages.mypy
          
          # required by trezor_agent_recovery tool
          gmp
        ];

        shellHook = with pkgs; ''
          if [ ! -d .venv ]; then
            python -m venv .venv
          fi

          source .venv/bin/activate

          export SOURCE_DATE_EPOCH=$(date +%s)
        '';
      };

      packages.${system} = rec {
        trezor_agent_recovery = pkgs.callPackage ./pkgs/trezor_agent_recovery { };
        image-iso = (import ./image {
          inherit (nixpkgs.lib) nixosSystem;
          inherit trezor_agent_recovery system;
        }).isoImage;
      };
    };
}