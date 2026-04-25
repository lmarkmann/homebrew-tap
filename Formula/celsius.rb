class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "e3be8f2290e9b32929c43dacc234750a08597cf18c59961f1cacf785be11eed7"
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
