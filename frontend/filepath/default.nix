{ mkDerivation, base, QuickCheck, stdenv }:
mkDerivation {
  pname = "filepath";
  version = "1.4.1.2";
  src = ./.;
  libraryHaskellDepends = [ base ];
  testHaskellDepends = [ base QuickCheck ];
  homepage = "https://github.com/haskell/filepath#readme";
  description = "Library for manipulating FilePaths in a cross platform way";
  license = stdenv.lib.licenses.bsd3;
}
