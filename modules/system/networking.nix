_:

{
  networking = {
    hostName = "workstation";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 443 80 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        FallbackDNS = [
          "1.1.1.1"
          "8.8.8.8"
        ];
      };
    };
  };
}
