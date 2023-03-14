self: super:
{
  adi1090x-plymouth = super.callPackage ./packages/adi1090x-plymouth {};
  buttermilk = super.callPackage ./packages/buttermilk {};
  marswm = super.callPackage ./packages/marswm {};
  pademelon = super.callPackage ./packages/pademelon {};

  nextcloud-client = super.nextcloud-client.overrideAttrs (old: rec {
    version = "3.7.3";
    src = super.fetchFromGitHub {
      owner = "nextcloud";
      repo = "desktop";
      rev = "v${version}";
      sha256 = "sha256-SzQdT2BJ0iIMTScJ7ft47oKd+na5MlOx5xRB1SQ7CBc=";
    };
  });
}
