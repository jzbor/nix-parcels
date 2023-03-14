self: super:
{
  adi1090x-plymouth = super.callPackage ./packages/adi1090x-plymouth {};
  buttermilk = super.callPackage ./packages/buttermilk {};
  marswm = super.callPackage ./packages/marswm {};
  pademelon = super.callPackage ./packages/pademelon {};
}
