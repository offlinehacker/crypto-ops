{ lib, python3Packages }:

python3Packages.buildPythonApplication {
    pname = "trezor-agent-recovery";
    version = "1.0";

    src = lib.cleanSource ./.;

    propagatedBuildInputs = with python3Packages; [
        libagent
        ecdsa
        mnemonic
        setuptools
    ];
}