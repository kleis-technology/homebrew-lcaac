class LcaacCli < Formula
  desc "Command-line interface tool for LCAAC"
  homepage "https://github.com/kleis-technology/lcaac"
  url "https://github.com/kleis-technology/lcaac/releases/download/v1.8.0/lcaac-cli-v1.8.0.tar.gz"
  sha256 "0492400125943b479afd0d079fcadf7d56c5222fb9b8987e966ffc4f52d7221b" # use `sha256sum <file.tar.gz>`
  version "1.8.0" # Replace with the appropriate version

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

