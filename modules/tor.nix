{ ... }:

{
  services.tor = {
    enable = true;
    controlPort = 9051;
    client.enable = true;
    client.transparentProxy.enable = true;
  };

  # use system tor
  environment.variables = {
    TOR_SOCKS_PORT = "9050";
    TOR_CONTROL_PORT = "9051";
    TOR_SKIP_LAUNCH = "1";
  };
}