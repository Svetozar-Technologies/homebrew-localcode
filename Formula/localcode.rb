class Localcode < Formula
  desc "AI-powered coding assistant for the terminal"
  homepage "https://github.com/Svetozar-Technologies/LocalCode"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-darwin-arm64.tar.gz"
      sha256 "8fee6dad9f57f63a59130d880fe2e5e897aef10b426972d242b0429be551b8af"
    end
    on_intel do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-darwin-x64.tar.gz"
      sha256 "8e7c1d9b317e245712e5b56152dc79d7086039af5811347860fd8987c67be7ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-linux-arm64.tar.gz"
      sha256 "cbd00a611d167e522803e7589df2f23edad9bade7521d74b8720c00bbd30a35b"
    end
    on_intel do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-linux-x64.tar.gz"
      sha256 "f7656f27776c2a3c05834c50971284d0ec0cf2b9da04c46c70815aa93375465b"
    end
  end

  def install
    platform = if OS.mac?
      "darwin"
    else
      "linux"
    end
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "localcode-#{platform}-#{arch}" => "localcode"
  end

  test do
    assert_match "LocalCode", shell_output("#{bin}/localcode --version")
  end
end
