class Dataseek < Formula
  desc "Search for datasets from the terminal"
  homepage "https://github.com/lmarkmann/dataseek"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.8.0/dataseek-aarch64-apple-darwin.tar.gz"
      sha256 "cf46bb1a2a0960e6968b4c09e01630d539544bd2e0ddb6a16cb05fd12d22de41"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.8.0/dataseek-x86_64-apple-darwin.tar.gz"
      sha256 "1c94f821b0500cb6796d129d3687a76986fa2ad851b9655133566eb622c78816"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.8.0/dataseek-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b7a8446ac83fbce7ddd38e18f4d599dec7a0aa0da47f3292123ffac99371eee"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.8.0/dataseek-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "651396b31323ec463682ae559d7d3c57c108a025e22a24c59aa5ebf9e7ff2874"
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
