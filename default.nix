{ mkDerivation, aeson, base, bytestring, conduit, conduit-extra
, monad-logger, persistent, persistent-postgresql
, persistent-template, resourcet, stdenv, text, transformers
, utf8-string
}:
mkDerivation {
  pname = "dumpdb";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base bytestring conduit conduit-extra monad-logger persistent
    persistent-postgresql persistent-template resourcet text
    transformers utf8-string
  ];
  license = stdenv.lib.licenses.mit;
}
