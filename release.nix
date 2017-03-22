{ reflex-platform ? import ./deps/reflex-platform {} , compiler ? "ghcjs" }:

let
  nixpkgs = reflex-platform.nixpkgs;
  haskellComp = reflex-platform.ghcjs;
  config = rec {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = self: super: rec {
	  frontend = import ./frontend {};
	};
      };
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  pkgs = import <nixpkgs> { inherit config; } // { inherit nixpkgs; };
    
  
in
  { frontend = pkgs.haskellPackages.frontend; }

  
