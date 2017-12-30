{ stdenv, openssl, gmpxx, llvm, ... } : 
stdenv.mkDerivation {
  name = "bn";
  version="0.0.0";
  src = ./.;
  buildInputs = [ gmpxx openssl llvm ];
  installPhase = "make PREFIX=$out/ install";
}
