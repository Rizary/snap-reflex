{ haskellPackages, fetchgit, extraBuildInputs ? [] }:
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
    
  ] ++ extraBuildInputs;
  license = null;
  passthru = {
    inherit haskellPackages;
  };
}