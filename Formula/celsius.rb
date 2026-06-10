class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://codeload.github.com/lmarkmann/celsius/tar.gz/refs/tags/v0.3.1"
  sha256 "ccd3685d807a5019d70f6f5ead411b4abdecdd2ec1e0cf497c4beb944aa20247"
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
