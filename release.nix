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
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  pkgs = nixpkgs.config.override { inherit config; };
in
  { frontend = pkgs.haskellPackages.frontend; }

  
