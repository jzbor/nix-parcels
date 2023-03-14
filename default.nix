self: super:
{
  adi1090x-plymouth = super.callPackage ./packages/adi1090x-plymouth {};
  buttermilk = super.callPackage ./packages/buttermilk {};
  marswm = super.callPackage ./packages/marswm {};
  nextcloud-client = super.callPackage ./packages/nextcloud-client {};
  pademelon = super.callPackage ./packages/pademelon {};
}
