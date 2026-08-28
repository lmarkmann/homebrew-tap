class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.6.1/celsius-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "256601aedb7022a7332e5c01cb29e48725f6a9b48ce7f528f71850825e460a68"
    end
    on_intel do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.6.1.tar.gz"
      sha256 "5d4ce4c265dc0f3c685326bd0c6f6ce273e8f417b5d1c7009d071239267a46c4"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.6.1/celsius-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6f69d52ebb9bebfb6b3ada1971339ec6b1d64dff76307b60a7bcb3abb59ae94f"
    end
    on_arm do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.6.1.tar.gz"
      sha256 "5d4ce4c265dc0f3c685326bd0c6f6ce273e8f417b5d1c7009d071239267a46c4"
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
