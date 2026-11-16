class LcaacCli < Formula
  desc "Command-line interface tool for LCAAC"
  homepage "https://github.com/kleis-technology/lcaac"
  url "https://github.com/kleis-technology/lcaac/releases/download/v3.1.0/lcaac-cli-v3.1.0.tar.gz"
  sha256 "b5ec357bfd2120d9417b697bf384ac94ff8e6dfb03cd503c5b05346282d5dff7" # use `sha256sum <file.tar.gz>
  version "3.1.0" # Replace with the appropriate version

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

