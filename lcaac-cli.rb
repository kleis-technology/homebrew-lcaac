class LcaacCli < Formula
  desc "Command-line interface tool for LCAAC"
  homepage "https://github.com/kleis-technology/lcaac"
  url "https://github.com/kleis-technology/lcaac/releases/download/v3.2.0/lcaac-cli-v3.2.0.tar.gz"
  sha256 "9d8e44ecde60c0192c96da613feda2709bee3af9b26730ebbcec00d8d3471081" # use `sha256sum <file.tar.gz>
  version "3.2.0" # Replace with the appropriate version

  depends_on "openjdk@17" # Use the Java version that your application requires

  def install
    # Install all files into the libexec directory
    libexec.install Dir["*"]

    # Symlink the main executable script into the bin directory
    (bin/"lcaac").write_env_script libexec/"bin/lcaac", Language::Java.overridable_java_home_env("17")
  end

  test do
    # Test that the command runs successfully and exits with status 0
    system "#{bin}/lcaac", "version"
  end
end

