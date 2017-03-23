{ reflex-platform ? import ../deps/reflex-platform {}, compiler ? "ghcjs" }:
let nixpkgs = reflex-platform.nixpkgs;
in import ./common.nix {
  haskellPackages = reflex-platform.${compiler};
  inherit (nixpkgs) fetchgit;
  extraBuildInputs = with reflex-platform.ghc; [
        cabal-macosx
        cabal-install
	ghc
        ];
}