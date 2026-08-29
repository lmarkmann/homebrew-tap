class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.7.0/celsius-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "d20225bf10ed3c74c871e4a28681b865ee3bf21e39daf2992e37d39e1e4d90cb"
    end
    on_intel do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.7.0.tar.gz"
      sha256 "93012d3f4b5322dab3926f27a45ee478a71b69ad147f123ef003ca7f23476da0"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.7.0/celsius-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "be9cf41dbd4607138e7805d086409a8e9af84c6a7bdee8f9e1731169cfafb49e"
    end
    on_arm do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.7.0.tar.gz"
      sha256 "93012d3f4b5322dab3926f27a45ee478a71b69ad147f123ef003ca7f23476da0"
      depends_on "rust" => :build
    end
  end

  head do
    url "https://github.com/lmarkmann/celsius.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if File.exist?("Cargo.toml")
      system "cargo", "install", *std_cargo_args
    else
      bin.install "celsius"
    end
  end

  test do
    assert_match "celsius", shell_output("#{bin}/celsius --version")
  end
end
