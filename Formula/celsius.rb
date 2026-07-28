class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.5.0/celsius-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "781d478c1b6293884ca0ed692766b7c74570159fc0deb0a1268cfdd67a4e3311"
    end
    on_intel do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.5.0.tar.gz"
      sha256 "8eaaf2f1e07f4a1fc8d678927f96f66f0ff377f1c00494d30d82dd265de2d772"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.5.0/celsius-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e70f4c61d8e5fff171e4ea235a0358f2eab6fbd52cd47c09f5f983cca6cbec50"
    end
    on_arm do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.5.0.tar.gz"
      sha256 "8eaaf2f1e07f4a1fc8d678927f96f66f0ff377f1c00494d30d82dd265de2d772"
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
