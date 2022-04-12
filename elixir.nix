with import <nixpkgs> {};

stdenv.mkDerivation {

  name = "elixir";

  buildInputs = [
    elixir
  ];
}
