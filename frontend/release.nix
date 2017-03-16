{ compiler ? "ghcjs" }:

let
  config = rec {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: with pkgs.haskell.lib; rec {
      haskell.packages.${compiler} = pkgs.haskell.packages.${compiler}.override {
        overrides = self: super: rec {
          tasty-ant-xml = self.callPackage ./tasty-ant-xml.nix {}; 

          frontend = self.callPackage ./default.nix {};
	 
          reflex   = self.callPackage ./reflex.nix {};

          reflex-dom = self.callPackage ./reflex-dom.nix {};
	};
      };
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  pkgs = import <nixpkgs> { inherit config; };

in
  { frontend = pkgs.haskell.packages.${compiler}.frontend; }