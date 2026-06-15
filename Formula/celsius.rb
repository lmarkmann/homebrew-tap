class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://codeload.github.com/lmarkmann/celsius/tar.gz/refs/tags/v0.4.2"
  sha256 "6a3e5c439db28b8ab37b2a693a04b83a019c8dd2a935c3bb2e614221f2c198c5"
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
