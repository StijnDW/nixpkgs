{ lib, stdenv, fetchFromGitHub, pkg-config, autoreconfHook, libpsm2 }:

stdenv.mkDerivation rec {
  pname = "libfabric";
  version = "1.12.0";

  enableParallelBuilding = true;

  src = fetchFromGitHub {
    owner = "ofiwg";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-OFp6nEW5D8vjglqLRbEgKryb2/KFuJD8Zn6rkpcuPh0=";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ] ;

  buildInputs = [ libpsm2 ] ;

  configureFlags = [ "--enable-psm2=${libpsm2}" ] ;

  meta = with lib; {
    homepage = "http://libfabric.org/";
    description = "Open Fabric Interfaces";
    license = with licenses; [ gpl2 bsd2 ];
    platforms = [ "x86_64-linux" ];
    maintainers = [ maintainers.bzizou ];
  };
}
