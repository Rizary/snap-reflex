{ mkDerivation, base, bifunctors, containers, data-default, deepseq
, dependent-map, dependent-sum, exception-transformers, fetchgit
, haskell-src-exts, haskell-src-meta, hlint, lens, MemoTrie
, monad-control, mtl, prim-uniq, primitive, ref-tf, reflection
, semigroupoids, semigroups, split, stdenv, stm, syb
, template-haskell, these, transformers, transformers-compat
}:
mkDerivation {
  pname = "reflex";
  version = "0.5.0";
  src = fetchgit {
    url = "https://github.com/reflex-frp/reflex.git";
    sha256 = "0ry5pqjzw85c1xnrzn4xd6k4f9bc4262mwbqagyy2h2fsj9qx517";
    rev = "4e7d1b13bc4019bdd793f59dd9c26d1d6d406d85";
  };
  libraryHaskellDepends = [
    base bifunctors containers data-default dependent-map dependent-sum
    exception-transformers haskell-src-exts haskell-src-meta lens
    MemoTrie monad-control mtl prim-uniq primitive ref-tf reflection
    semigroupoids semigroups stm syb template-haskell these
    transformers transformers-compat
  ];
  testHaskellDepends = [
    base bifunctors containers deepseq dependent-map dependent-sum
    hlint mtl ref-tf split these transformers
  ];
  homepage = "https://github.com/reflex-frp/reflex";
  description = "Higher-order Functional Reactive Programming";
  license = stdenv.lib.licenses.bsd3;
}
