{ mkDerivation, base, bytestring, concurrent-extra, fetchgit, HDBC
, mtl, stdenv, time, unixODBC, utf8-string
}:
mkDerivation {
  pname = "HDBC-odbc";
  version = "2.5.0.0";
  src = fetchgit {
    url = "https://github.com/abbradar/hdbc-odbc";
    sha256 = "0m2hl684c26ayjq1fcv2gx55k29yl0fi3wkm9yp1bab3fwf6q1nb";
    rev = "79ffd1f5060d2c8b5cbdfd4eba8ae6414372d6b7";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring concurrent-extra HDBC mtl time utf8-string
  ];
  librarySystemDepends = [ unixODBC ];
  homepage = "https://github.com/hdbc/hdbc-odbc";
  description = "ODBC driver for HDBC";
  license = stdenv.lib.licenses.bsd3;
}
