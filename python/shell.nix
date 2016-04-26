{ pkgs ? import <nixpkgs> {} }:

(pkgs.python3.buildEnv.override {
  extraLibs = with pkgs.python3Packages; [
    psycopg2 sqlalchemy
  ];
}).env
