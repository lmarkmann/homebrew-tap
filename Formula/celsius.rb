class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://codeload.github.com/lmarkmann/celsius/tar.gz/refs/tags/v0.4.7"
  sha256 "d6746aa5002af3c62b14de1a6095700319fbed69a687376b16928c4c013effca"
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
