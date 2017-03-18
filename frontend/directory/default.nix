{ mkDerivation, base, filepath, stdenv, time, unix }:
mkDerivation {
  pname = "directory";
  version = "1.3.1.1";
  src = ./.;
  libraryHaskellDepends = [ base filepath time unix ];
  testHaskellDepends = [ base filepath time unix ];
  description = "Platform-agnostic library for filesystem operations";
  license = stdenv.lib.licenses.bsd3;
}
