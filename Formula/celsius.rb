class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.6.0/celsius-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1091e863bb767619b4f1c2cccc78d3274aa3fe5a27347e013135c891a1adc2f"
    end
    on_intel do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.6.0.tar.gz"
      sha256 "e7f2dbe9a5cb39593e4ab86304e785623ac3b8a34ff2997342891cab1c9277f7"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.6.0/celsius-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "29d018bc49e1c3152b0cad47e6b6862d5a828680b6d10c7741637ca1d2dd425f"
    end
    on_arm do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.6.0.tar.gz"
      sha256 "e7f2dbe9a5cb39593e4ab86304e785623ac3b8a34ff2997342891cab1c9277f7"
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
