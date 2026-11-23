class Dataseek < Formula
  desc "Search for datasets from the terminal"
  homepage "https://github.com/lmarkmann/dataseek"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.11.0/dataseek-aarch64-apple-darwin.tar.xz"
      sha256 "d8d1190df3833e6f6f77f6a08c2f23ec607bbe031cdd53299390768ac86a836a"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.11.0/dataseek-x86_64-apple-darwin.tar.xz"
      sha256 "4a7ea0744e7b45f163110294ff99375c820b5e2feea6f56cf91c9f4a0f96806b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.11.0/dataseek-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "baf1e92435bbdd2fcc97c81603ffe66264ddda75ca96d2948678eb4f6519765c"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.11.0/dataseek-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eb8cd17a36fa13d3063add851edd1594dac6b7954206a1999d32928d1ee3269d"
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
