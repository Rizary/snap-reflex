{ haskellPackages, fetchgit, extraBuildInputs ? [], extraPkgs ? []}:
haskellPackages.mkDerivation {
  pname = "backend";
  version = "0.1";
  src = ./.;
  preConfigure = ''
    ln -sfT "${../shared/src}" ./src-shared
  '';
  isExecutable = true;
  isLibrary = false;
  buildDepends = with haskellPackages; [

    snap
    snap-core
    snap-server
    heist
    
    
  ] ++ extraBuildInputs ++ extraPkgs;
  license = null;
  passthru = {
    inherit haskellPackages;
  };
}