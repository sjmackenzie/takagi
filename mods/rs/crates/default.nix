{ lib, buildPlatform, buildRustCrate, fetchgit, edgesModule, rustc, makeWrapper, stdenv }:

let
  mapFeatures = features: map (fun: fun { features = features; });
  crates = import ./Cargo.nix { inherit lib buildPlatform buildRustCrate fetchgit; }; in
crates
