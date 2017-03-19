{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "frontend";
  version = "0.0.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = stdenv.lib.licenses.mpl20;
}
