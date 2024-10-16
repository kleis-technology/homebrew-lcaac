class LcaacCli < Formula
  desc "Command-line interface tool for LCAAC"
  homepage "https://github.com/kleis-technology/lcaac"
  url "https://github.com/kleis-technology/lcaac/releases/download/v1.7.9/lcaac-cli-v1.7.9.tar.gz"
  sha256 "3ad9c9b5871c5a9c907f1e9834614e58ef57e42aaa735c6fb9bc7ca4f8df09ea"
  version "1.7.9" # Replace with the appropriate version

  depends_on "openjdk@17" # Use the Java version that your application requires

  def install
    # Install all files into the libexec directory
    libexec.install Dir["*"]

    # Symlink the main executable script into the bin directory
    (bin/"lcaac").write_env_script libexec/"bin/lcaac", Language::Java.overridable_java_home_env("17")
  end

  test do
    # Test that the CLI returns the expected help message or version output
    assert_match "Usage", shell_output("#{bin}/lcaac --help")
  end
end

