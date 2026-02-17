class AsanaCli < Formula
  desc "Beautiful Asana CLI with TUI and sync daemon"
  homepage "https://github.com/TheCoolRobot/asana-cli"
  license "MIT"
  version "v0.1.0"
  
  on_macos do
    on_intel do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-darwin-amd64"
      sha256 "92ed13dbc15521670900f00bac5cd036fc8429746667316d7e581fc3ceb0d9a2"
    end
    on_arm do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-darwin-arm64"
      sha256 "708261a038a0bb03677cdd44873356df8f835b11e863b6377a499a3d1f95f31a"
    end
  end
  
  on_linux do
    url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-linux-amd64"
    sha256 "b5485a166605004e9df3727d2f717d1a1b6b01e6fd1593a2be362bdb90f1f0ea"
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
