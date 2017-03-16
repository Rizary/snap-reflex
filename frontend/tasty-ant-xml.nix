{ mkDerivation, base, containers, directory, fetchgit, filepath
, generic-deriving, ghc-prim, mtl, stdenv, stm, tagged, tasty
, transformers, xml
}:
mkDerivation {
  pname = "tasty-ant-xml";
  version = "1.0.5";
  src = fetchgit {
    url = "https://github.com/ocharles/tasty-ant-xml.git";
    sha256 = "1jhj2xk55skd2hg7k4xpccr21902dlr8krdpk8niq5bbizy41cif";
    rev = "79e4d6dded97afe86d11ef000b2f5be89c9f9c4b";
  };
  libraryHaskellDepends = [
    base containers directory filepath generic-deriving ghc-prim mtl
    stm tagged tasty transformers xml
  ];
  homepage = "http://github.com/ocharles/tasty-ant-xml";
  description = "Render tasty output to XML for Jenkins";
  license = stdenv.lib.licenses.bsd3;
}
