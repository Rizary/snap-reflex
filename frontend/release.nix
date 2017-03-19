{ compiler ? "ghcjs" }:

let

  config = rec {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
	  "${compiler}" = pkgs.haskell.packages.${compiler}.override {
            overrides = self: super: rec {         
	  
              frontend = self.callPackage ./default.nix {};
	 
	    };
	  };
	};
      };
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  pkgs = import ./nixpkgs { inherit config; };

in
  { frontend = pkgs.haskell.packages.${compiler}.frontend; }