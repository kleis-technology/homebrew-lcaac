class LcaacCli < Formula
  desc "Command-line interface tool for LCAAC"
  homepage "https://github.com/kleis-technology/lcaac"
  url "https://github.com/kleis-technology/lcaac/releases/download/v1.7.13/lcaac-cli-v1.7.13.tar.gz"
  sha256 "fb085852891adf9b0bdc245afaed0e993cfee5a62ded3ae4ab78ae0b929b68b1" # use `sha256sum <file.tar.gz>`
  version "1.7.13" # Replace with the appropriate version

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

