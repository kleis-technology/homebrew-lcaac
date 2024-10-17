{ 
    pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
    , lib ? pkgs.lib
    , stdenv ? pkgs.stdenv
    , fetchurl ? pkgs.fetchurl
    , jdk ? pkgs.jdk }:

stdenv.mkDerivation rec {
  pname = "lcaac";
  version = "1.7.10";

  src = fetchurl {
    url = "https://github.com/kleis-technology/lcaac/releases/download/v1.7.10/lcaac-cli-v1.7.10.tar.gz";
    hash = "sha256-jCcxU+8mszllDvfAQhWMuPfN9DB2jSiM1qMGsvi0uzo=";
  };

  nativeBuildInputs = [ jdk ];

  buildPhase = ''
    # No build is needed since we are using a pre-packaged distribution
    echo "Skipping build phase"
  '';

  installPhase = ''
    # Install all files under $out
    mkdir -p $out/libexec
    cp -r * $out/libexec

    # Create a wrapper script for the executable
    mkdir -p $out/bin
    ln -s $out/libexec/bin/lcaac $out/bin/lcaac
  '';

  # Test the package by verifying that the command runs successfully
  checkPhase = ''
    $out/bin/lcaac version
  '';

  meta = with lib; {
    description = "Command-line interface tool for LCAAC";
    homepage = "https://github.com/kleis-technology/lcaac";
    license = licenses.mit; # Replace with the actual license if different
    maintainers = [ "kleis-technology" ]; # Replace with the actual maintainer
    platforms = platforms.linux ++ platforms.darwin;
  };
}

