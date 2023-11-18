# source: https://github.com/connorfeeley/goatcounter-flake
self: super:

{
  goatcounter = super.callPackage (
    { pkgs, lib, buildGoModule, fetchFromGitHub }:

    buildGoModule rec {
      pname = "goatcounter";
      version = "2.4.1";

      src = fetchFromGitHub {
        owner = "arp242";
        repo = "goatcounter";
        rev = "v${version}";
        hash = "sha256-L4310L+L2Qn8NkRMqze7KNwZ18LXz8PAoXCCpYa5J4I=";
      };
      vendorHash = "sha256-nKfqZ5hGGVLBY/hnJJPCrS/9MlGoR2MWFUWDnpwWgyM=";

      subPackages = "cmd/goatcounter";

      buildInputs = with pkgs; [ postgresql sqlite ];

      # Enable CGO if SQLite support is required.
      CGO_ENABLED = "1";
      # Set version.
      ldflags = [ "-X zgo.at/goatcounter/v2.Version=${version}" ];

      meta = with lib; {
        description = "Privacy-focused, self-hosted web analytics";
        homepage = "https://www.goatcounter.com/";
        license = licenses.mit;
        maintainers = with maintainers; [ cfeeley ];
      };
    }

  ) {};
}
