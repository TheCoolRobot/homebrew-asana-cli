class AsanaCli < Formula
  desc "Beautiful Asana CLI with TUI and sync daemon"
  homepage "https://github.com/TheCoolRobot/asana-cli"
  license "MIT"
  version "v0.2.1"
  
  on_macos do
    on_intel do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.2.1/asana-cli-darwin-amd64"
      sha256 "19371c226602477afcd6288bb3a998c1c600ea649bfb87834444d4f0fde3898e"
    end
    on_arm do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.2.1/asana-cli-darwin-arm64"
      sha256 "f29e260c9e22d33f683c60486410d4717eb776bef071de72c12a7c63b22e111e"
    end
  end
  
  on_linux do
    url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.2.1/asana-cli-linux-amd64"
    sha256 "25e9edb4dd1b9384c08c9d34f95adba075fb266ffc147e4393498882f9b22355"
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
