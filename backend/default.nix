{ reflex-platform ? import ../deps/reflex-platform {}, compiler ? "ghc" }:
let nixpkgs = reflex-platform.nixpkgs;
in import ./common.nix {
  haskellPackages = reflex-platform.${compiler};
  inherit (nixpkgs) fetchgit;
  extraBuildInputs = with reflex-platform.ghc; [
    cabal-macosx
    cabal-install
    ghc
  ];
  extraPkgs = with nixpkgs; [
    darwin.cctools
    darwin.libobjc
    darwin.apple_sdk.libs.xpc
    osx_sdk
  ];
}