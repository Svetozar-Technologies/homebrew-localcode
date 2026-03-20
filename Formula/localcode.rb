class Localcode < Formula
  desc "AI-powered coding assistant for the terminal"
  homepage "https://github.com/Svetozar-Technologies/LocalCode"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-darwin-arm64.tar.gz"
      sha256 "863828ee953920692c3affe0abbed978a4cb31e84907a4f13b39359683cf4ee1"
    end
    on_intel do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-darwin-x64.tar.gz"
      sha256 "5a1f41bff486f06d91d89d2164d8407ca53a4700f60f99e38534defe36f04994"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-linux-arm64.tar.gz"
      sha256 "6ac6b3ba39dc4753919fe4431d10a07607676311f39837ef67c99d5ae8b83273"
    end
    on_intel do
      url "https://github.com/Svetozar-Technologies/LocalCode/releases/download/v#{version}/localcode-linux-x64.tar.gz"
      sha256 "c698f5660c83dd7199331b901a5cf3c10aa200e52d5270a443454bec2099fdda"
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
