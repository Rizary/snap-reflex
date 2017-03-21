{ reflex-platform ? import ./deps/reflex-platform {} , compiler ? "ghcjs" }:

let
  nixpkgs = reflex-platform.nixpkgs;
  haskellPackages = reflex-platform.ghcjs;
  config = rec {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: rec {
      haskellPackages = haskellPackages.override {
        overrides = self: super: rec {
	  frontend = import ./frontend { inherit reflex-platform; };
	};
      };
      
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
	  "${compiler}" = pkgs.haskell.packages.${compiler}.override {
            overrides = self: super: rec {	      
	    };
	  };
	};
      };
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  pkgs = nixpkgs.overridePackages (self: super: {
    config = super.config // super.config.override { inherit config; };
    inherit haskellPackages;
  });

in
  { frontend = pkgs.haskellPackages.frontend; }

  
