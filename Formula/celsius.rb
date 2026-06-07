class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "c9401d4ef8a737f3e6e7d52a8dfb76aa1be8fc76f89df533d58512b88f82aac8"
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
