class AsanaCli < Formula
  desc "Beautiful Asana CLI with TUI and sync daemon"
  homepage "https://github.com/TheCoolRobot/asana-cli"
  license "MIT"
  version "v0.2.0"
  
  on_macos do
    on_intel do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.2.0/asana-cli-darwin-amd64"
      sha256 "cc25152082777984a074c23ca241a037b828f9d76bdfa5b26f4e1a95b159a24c"
    end
    on_arm do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.2.0/asana-cli-darwin-arm64"
      sha256 "597dcfad46edd4bdea691502bd21cbef4ff11486bcd3614b1cc86a3afb009700"
    end
  end
  
  on_linux do
    url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.2.0/asana-cli-linux-amd64"
    sha256 "9555864bc3d6beaa8c543f208ab24642a66d721cea7b2f2b23f523c8d0d5124a"
  end
  
  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "asana-cli-darwin-amd64" => "asana-cli"
      elsif Hardware::CPU.arm?
        bin.install "asana-cli-darwin-arm64" => "asana-cli"
      end
    elsif OS.linux?
      bin.install "asana-cli-linux-amd64" => "asana-cli"
    end
  end
  
  def post_install
    puts "✓ Asana CLI installed successfully!"
    puts "Get started: asana-cli config set --token YOUR_TOKEN"
  end
  
  test do
    system "#{bin}/asana-cli", "--version"
  end
end
