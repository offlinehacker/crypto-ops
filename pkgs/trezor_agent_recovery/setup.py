from setuptools import setup, find_packages


setup(
    name="trezor_agent_recovery",
    version="1.0",
    packages = find_packages(),
    install_requires=[
        "mnemonic",
        "libagent",
        "ecdsa"
    ],
    entry_points = {
        "console_scripts": [
            "trezor-agent-recovery=trezor_agent_recovery:main"
        ],
    },
)