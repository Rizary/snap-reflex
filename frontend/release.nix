{ compiler ? "ghcjs" }:

let
  cabal2nixResult = src: pkgs.runCommand "cabal2nixResult" {
    buildCommand = ''
      cabal2nix file://"${src}" > "$out"
    '';
    buildInputs = with pkgs; [ cabal2nix]; } "";

  sources = {
    gtk2hs = pkgs.fetchFromGitHub {
      owner = "gtk2hs";
      repo = "gtk2hs";
      rev = "eee61d84edf1dd44f8d380d7d7cae2405de50124";
      sha256 = "12i53grimni0dyjqjydl120z5amcn668w4pfhl8dxscjh4a0l5nb";
    };
  };

  config = rec {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: with pkgs.haskell.lib; rec {
      haskell.packages.${compiler} = pkgs.haskell.packages.${compiler}.override {
        overrides = self: super: rec {

          gtk2hs-buildtools = self.callPackage (cabal2nixResult "${sources.gtk2hs}/tools") {};

          semigroups = pkgs.haskell.lib.addBuildDepends
                         super.semigroups (with self; [
			   hashable
			   tagged
			   text
			   unordered-containers
			 ]);

          directory = self.callPackage ./directory/default.nix {};

          filepath = self.callPackage ./filepath/default.nix {};

          tasty-ant-xml = self.callPackage ./tasty-ant-xml.nix {};          
	  
          frontend = self.callPackage ./default.nix {};
	 
          reflex   = self.callPackage ./reflex {};

          reflex-dom = self.callPackage ./reflex-dom {};
	};
      };
    };
    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
  };

  ghc801 = import ./ghc801/default.nix {};

  pkgs = import ./nixpkgs { inherit config; } // ghc801;

in
  { frontend = pkgs.haskell.packages.${compiler}.frontend; }