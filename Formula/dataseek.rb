class Dataseek < Formula
  desc "Search for datasets from the terminal"
  homepage "https://github.com/lmarkmann/dataseek"
  version "0.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.1/dataseek-aarch64-apple-darwin.tar.gz"
      sha256 "2e6e6c949231383194e9f15f9318fb49e9132a7cddfc779ebf50c458cc2bf834"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.1/dataseek-x86_64-apple-darwin.tar.gz"
      sha256 "a80fc5fc6b3454f575601321e8995a70752229f3367958b38317035d0a4ad869"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.1/dataseek-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "748db9420176f8edd80dcc9e066c94d86d35252ea5c7955a034e8b2ba9366c3d"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.9.1/dataseek-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "262db634a822151f14ac8a8bfbae3cd16f94718036c8b3000fed3f206f8e27dd"
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
