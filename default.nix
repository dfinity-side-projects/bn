{ pkgs ? import <nixpkgs> {} }:
with pkgs; let
  drv = import ./bn.nix {
    inherit make clang llvm gmpxx openssl;
    stdenv = clangStdenv;
  };
in
  drv
