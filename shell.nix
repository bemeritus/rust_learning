{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell rec {
  nativeBuildInputs = with pkgs; [
    pkg-config
    rustc
    cargo
    gcc
    rustfmt
  ];
  buildInputs = with pkgs; [
    clang
    llvmPackages.bintools
    rustup
  ];

  RUSTC_VERSION = builtins.readFile ./rust-toolchain.toml;
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
