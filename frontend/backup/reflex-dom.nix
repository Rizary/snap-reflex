{ mkDerivation, aeson, base, bifunctors, bimap, blaze-builder
, bytestring, containers, data-default, dependent-map
, dependent-sum, dependent-sum-template, directory
, exception-transformers, fetchgit, ghcjs-dom, glib, gtk3, hlint
, keycode, lens, monad-control, mtl, primitive, random
, raw-strings-qq, ref-tf, reflex, semigroups, stdenv, stm
, template-haskell, text, these, time, transformers
, unbounded-delays, unix, webkit, webkitgtk3
, webkitgtk3-javascriptcore, zenc
}:
mkDerivation {
  pname = "reflex-dom";
  version = "0.4";
  src = fetchgit {
    url = "https://github.com/reflex-frp/reflex-dom.git";
    sha256 = "0fizl49c1k7nvyi3ahrsi53zyzcnn75lcwmb9l2wgd8sljc8cv5n";
    rev = "ff9351a1859a07f8f3892d6381e9d5d0cd500d5d";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bifunctors bimap blaze-builder bytestring containers
    data-default dependent-map dependent-sum dependent-sum-template
    directory exception-transformers ghcjs-dom glib gtk3 keycode lens
    monad-control mtl primitive random raw-strings-qq ref-tf reflex
    semigroups stm template-haskell text these time transformers
    unbounded-delays unix webkitgtk3 webkitgtk3-javascriptcore zenc
  ];
  libraryPkgconfigDepends = [ webkit ];
  testHaskellDepends = [ base hlint ];
  description = "Functional Reactive Web Apps with Reflex";
  license = stdenv.lib.licenses.bsd3;
}
