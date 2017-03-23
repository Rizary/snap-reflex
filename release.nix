{ reflex-platform ? import ./deps/reflex-platform {} , compiler ? "ghc"}:

let
  nixpkgs = reflex-platform.nixpkgs;
  config = rec {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = self: super: rec {
	  frontend = import ./frontend { inherit reflex-platform compiler; };
	};
      };
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  pkgs = import <nixpkgs> { inherit config; } // { inherit nixpkgs; };
    
  
in
  { frontend = pkgs.haskellPackages.frontend; }

  
