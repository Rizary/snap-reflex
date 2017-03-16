{ mkDerivation, base, reflex, reflex-dom, stdenv }:
mkDerivation {
  pname = "frontend";
  version = "0.0.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base reflex reflex-dom ];
  license = stdenv.lib.licenses.mpl20;
}
