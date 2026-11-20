{ 
    lib
    , stdenv
    , fetchurl
    , jdk17
    , makeBinaryWrapper
}:

stdenv.mkDerivation rec {
  pname = "lcaac";
  version = "3.2.0";

  src = fetchurl {
    url = "https://github.com/kleis-technology/lcaac/releases/download/v3.2.0/lcaac-cli-v3.2.0.tar.gz";
#   sha256 = lib.fakeSha256;
    sha256 = "sha256-nY5E7N5gwBksltphP+2icJvuOvmyZzDrvOwA2NNHEIE=";
  };

  nativeBuildInputs = [ makeBinaryWrapper ];
  buildInputs = [ jdk17 ];

  buildPhase = ''
    # No build is needed since we are using a pre-packaged distribution
    echo "Skipping build phase"
  '';

  installPhase = ''
    # Install all files under $out
    mkdir -p $out
    cp -r * $out
    wrapProgram $out/bin/lcaac \
        --prefix PATH : ${lib.makeBinPath [ jdk17 ]}
  '';

  # Test the package by verifying that the command runs successfully
  checkPhase = ''
    $out/bin/lcaac version
  '';

  meta = with lib; {
    description = "Command-line interface tool for LCAAC";
    homepage = "https://github.com/kleis-technology/lcaac";
    # license = licenses.mit; # Replace with the actual license if different
    maintainers = [ "kleis-technology" ]; # Replace with the actual maintainer
    platforms = platforms.linux ++ platforms.darwin;
  };
}

