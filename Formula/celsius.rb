class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://codeload.github.com/lmarkmann/celsius/tar.gz/refs/tags/v0.4.5"
  sha256 "197aa8b0ce6fd4e04b294f0e57a9401777b96230c0fbd363eb029df146b9be63"
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
