{ haskellPackages, fetchgit, extraBuildInputs ? [], extraPkgs ? []}:
haskellPackages.mkDerivation {
  pname = "frontend";
  version = "0.1";
  src = ./.;
  preConfigure = ''
    ln -sfT "${../shared/src}" ./src-shared
  '';
  isExecutable = true;
  isLibrary = false;
  buildDepends = with haskellPackages; [
  
    reflex
    reflex-dom
    safe
    text
    containers
    cabal-macosx
    ghcjs-dom
    jsaddle-wkwebview
    
  ] ++ extraBuildInputs ++ extraPkgs;
  license = null;
  passthru = {
    inherit haskellPackages;
  };
}