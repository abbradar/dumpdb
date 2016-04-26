{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  haskellPackages_ = haskellPackages.override {
    overrides = self: super: with pkgs.haskell.lib; {
      HDBC-odbc = dontHaddock (self.callPackage ./hdbc-odbc.nix { });
    };
  };

  drv = haskellPackages_.callPackage ./default.nix {};

in

  if pkgs.lib.inNixShell then drv.env else drv
