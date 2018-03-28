{ stdenv, openssl, gmpxx, llvm, ... } : 
stdenv.mkDerivation {
  name = "bn";
  version="0.0.0";
  src = ./.;
  buildInputs = [ gmpxx openssl llvm ];
  installPhase = 
    "make PREFIX=$out/ install;" +
    stdenv.lib.optionalString stdenv.isDarwin ''
      install_name_tool -change lib/libmcl.dylib $out/lib/libmcl.dylib $out/lib/libbls384.dylib
      install_name_tool -id $out/lib/libbls384.dylib $out/lib/libbls384.dylib
      install_name_tool -id $out/lib/libmcl.dylib $out/lib/libmcl.dylib
    '';
}
