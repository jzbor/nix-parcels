{
  description = "jzbor's personal overlay";

  outputs = { self, ... }: {
    # Default overlay
    overlay = import ./default.nix;
  };

  # See also: https://github.com/mozilla/nixpkgs-mozilla
}
