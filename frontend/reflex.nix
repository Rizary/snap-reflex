{ mkDerivation, base, bifunctors, containers, criterion
, data-default, deepseq, dependent-map, dependent-sum
, exception-transformers, fetchgit, haskell-src-exts
, haskell-src-meta, hlint, lens, loch-th, MemoTrie, monad-control
, mtl, prim-uniq, primitive, process, ref-tf, reflection
, semigroupoids, semigroups, split, stdenv, stm, syb
, template-haskell, these, time, transformers, transformers-compat
}:
mkDerivation {
  pname = "reflex";
  version = "0.5.0";
  src = fetchgit {
    url = "https://github.com/reflex-frp/reflex";
    sha256 = "10sryvwdf88ajkp35yma8llkb38cp63vjr5mq2hba4s2d8yg649q";
    rev = "d78ba4318c425ca9b942dc387d7c5c7ab2d2e095";
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
  benchmarkHaskellDepends = [
    base containers criterion deepseq dependent-map dependent-sum
    loch-th mtl primitive process ref-tf split stm time transformers
  ];
  homepage = "https://github.com/reflex-frp/reflex";
  description = "Higher-order Functional Reactive Programming";
  license = stdenv.lib.licenses.bsd3;
}
