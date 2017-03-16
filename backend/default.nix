{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "backend";
  version = "0.0.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = stdenv.lib.licenses.mpl20;
}
