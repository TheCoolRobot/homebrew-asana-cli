class AsanaCli < Formula
  desc "Beautiful Asana CLI with TUI and sync daemon"
  homepage "https://github.com/TheCoolRobot/asana-cli"
  license "MIT"
  version "v0.1.0"
  
  on_macos do
    on_intel do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-darwin-amd64"
      sha256 "1be99bf853e2185b1b65d2ba902a7aab439d9a86190df59a9911a7960d94bad4"
    end
    on_arm do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-darwin-arm64"
      sha256 "7710d39831deb32aff09307b101cf6d57a92c3c107edfd20eb0ef03c33d5d55c"
    end
  end
  
  on_linux do
    url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-linux-amd64"
    sha256 "c8df366c5ce2d8e5a919b7a1990bf51ef260d86576058c077c2d3f6a375b3f71"
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
