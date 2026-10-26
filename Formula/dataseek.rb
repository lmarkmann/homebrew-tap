class Dataseek < Formula
  desc "Search for datasets from the terminal"
  homepage "https://github.com/lmarkmann/dataseek"
  version "0.10.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.1/dataseek-aarch64-apple-darwin.tar.xz"
      sha256 "6b503b2e71c62b241d05b0bf4141483a760d25fa818105b27e1049ac0172cb49"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.1/dataseek-x86_64-apple-darwin.tar.xz"
      sha256 "60e7720938adb78a5a85bec8cb63aed637196d7d62244a85a251e994568f3c51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.1/dataseek-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6b82ac84e94847765b5c6dc7d9337ef8bac33bda12dbfdce916e2adc633dcb17"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.1/dataseek-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1e5f980aab2f13e8415eaa2d13485fed597b33040e77831419d84dbb280c9e5a"
    end
  end

  def install
    bin.install "dataseek", "dsk"
    generate_completions_from_executable(bin/"dataseek", "completion")
    generate_completions_from_executable(bin/"dsk", "completion")
    (man1/"dataseek.1").write Utils.safe_popen_read(bin/"dataseek", "man")
    man1.install_symlink "dataseek.1" => "dsk.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dsk --version")
  end
end
