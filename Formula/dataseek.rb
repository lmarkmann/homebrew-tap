class Dataseek < Formula
  desc "Search for datasets from the terminal"
  homepage "https://github.com/lmarkmann/dataseek"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.0/dataseek-aarch64-apple-darwin.tar.gz"
      sha256 "21eb544d3572c2e26ce70612d4ab1bb795754a7adf50f870bd7c23349e71d659"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.0/dataseek-x86_64-apple-darwin.tar.gz"
      sha256 "d65e35260c08736ef28f110395e6cdcadf68649652d582ab3c09ae5b39cb9b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.0/dataseek-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc719b75e6a4919326571ea244760ca394a9371e03be274a26b0a672b39e01b8"
    end
    on_intel do
      url "https://github.com/lmarkmann/dataseek/releases/download/v0.10.0/dataseek-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c647569299486ea04edff156f665947f080f5c484fa6dab8cef775b38747e85"
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
