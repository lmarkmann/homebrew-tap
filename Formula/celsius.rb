class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.8.0/celsius-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "dce574f9aee8c3055ffab0e2a7920886694ed4cc60f00f3c23b879419a9666ee"
    end
    on_intel do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.8.0.tar.gz"
      sha256 "843fdfd0e6a1688778fc28c8599b4051a5d78b6560b29cbab3724778f1924fb7"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.8.0/celsius-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4fe13a3f01c244027c9f6d8800a9a991315feeb5099c88adbf2cf7f3a90dbd11"
    end
    on_arm do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.8.0.tar.gz"
      sha256 "843fdfd0e6a1688778fc28c8599b4051a5d78b6560b29cbab3724778f1924fb7"
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
