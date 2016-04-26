{ mkDerivation, aeson, base, bytestring, conduit, conduit-extra
, monad-logger, persistent, persistent-odbc, persistent-template
, resourcet, stdenv, text
}:
mkDerivation {
  pname = "dumpdb";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base bytestring conduit conduit-extra monad-logger persistent
    persistent-odbc persistent-template resourcet text
  ];
  license = stdenv.lib.licenses.mit;
}
