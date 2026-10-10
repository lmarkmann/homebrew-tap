class Dataseek < Formula
  desc "Search for datasets from the terminal"
  homepage "https://github.com/lmarkmann/dataseek"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.0/dataseek-aarch64-apple-darwin.tar.gz"
      sha256 "4ef85d1af374bc84a4f3f7fb1f68263743234f788a7ea0d5d2600a6feed43522"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.0/dataseek-x86_64-apple-darwin.tar.gz"
      sha256 "ddef49a614263024b41bb367810af0b5ecdea3b90d3c1ce2e4c05b9da3e5b3b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.0/dataseek-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d23069253af49bf0be865d6de8f6d5c523468cc73585c970e310878aba8fb6da"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.0/dataseek-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5024da9d9a7d2da6250fc640ddbb81231d2f477181e02f25fa47fdd554aa653"
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
