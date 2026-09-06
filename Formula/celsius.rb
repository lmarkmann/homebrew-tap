class Celsius < Formula
  desc "Terminal weather as a first-person sky view"
  homepage "https://github.com/lmarkmann/celsius"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.8.1/celsius-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "81105ab3d3627e2e859cb486ad88b6c7cf9ce3bde2e066dea65978c8fdb94c21"
    end
    on_intel do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.8.1.tar.gz"
      sha256 "cdc79a4551a5e0a5c9cde4e0e7f6d72e9854d870653dfb8af18732f90350307d"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lmarkmann/celsius/releases/download/v0.8.1/celsius-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3fc5b64dc80cf1e827c429c8dafd85350bafc6940e6efda02e47b0c05421424a"
    end
    on_arm do
      url "https://github.com/lmarkmann/celsius/archive/refs/tags/v0.8.1.tar.gz"
      sha256 "cdc79a4551a5e0a5c9cde4e0e7f6d72e9854d870653dfb8af18732f90350307d"
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
