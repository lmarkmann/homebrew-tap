class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://codeload.github.com/lmarkmann/celsius/tar.gz/refs/tags/v0.3.2"
  sha256 "bdbe31074857dd12ab662d2da29023c82f84ac7f9a4935d7f8e17df06ad0e472"
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
