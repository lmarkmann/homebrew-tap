class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fd5ca42c1a03e19fc1fb6add3a370fc65cd1bac6a767199e08aaa2d866a49521"
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
