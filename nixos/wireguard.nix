{ ... }:

{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard = {
    enable = true;
    interfaces = {
      wifi = {
        ips = [ "0.7.0.3/24" "fddd:2c4:2c4:2c4::3/64" ]; 
        listenPort = 51820;
        privateKey = "+CmktwaC/aeZvLwTX3qPjA3nLZVT1iSARue/GOTEf3Y=";
        peers = [{
          publicKey = "1LwDltg4EnM+ZtXWTRnAXT+ekJjmKvpZnHjk+T3gHgk=";
          allowedIps = [ "0.0.0.0/0" "::/0" ];
          endpoint = "samburcksen.freemyip.com:51820";
          persistentKeppalive = 25;
        }];
      };
    };
  };
}
