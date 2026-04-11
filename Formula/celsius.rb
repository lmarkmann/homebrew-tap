class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fec8ca7821e3642dd5df6ba98e793dbe61b8232afe934a649a3f54f3c89bfd1d"
  license "MIT"
  head "https://github.com/lmarkmann/celsius.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "celsius", shell_output("#{bin}/celsius --help")
  end
end
