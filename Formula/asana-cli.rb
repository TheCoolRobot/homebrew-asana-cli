class AsanaCli < Formula
  desc "Beautiful Asana CLI with TUI and sync daemon"
  homepage "https://github.com/TheCoolRobot/asana-cli"
  license "MIT"
  version "v0.1.0"
  
  on_macos do
    on_intel do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-darwin-amd64"
      sha256 "0c690e2ab102499b525a53872f4e4a7588412052e77ad350666da28c66c2adf8"
    end
    on_arm do
      url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-darwin-arm64"
      sha256 "b8e1446475badc9278bac7b197604880cede5d9af99d8fef11999791dd249fe0"
    end
  end
  
  on_linux do
    url "https://github.com/TheCoolRobot/asana-cli/releases/download/v0.1.0/asana-cli-linux-amd64"
    sha256 "a8dbc5d5d12702a089c07e7d7e50f06957ce276efebc1555a14995ad6c1ba498"
  end
  
  def install
    bin.install "asana-cli-#{os}-#{arch}" => "asana-cli"
  end
  
  def post_install
    puts "✓ Asana CLI installed successfully!"
    puts "Get started: asana-cli config set --token YOUR_TOKEN"
  end
  
  test do
    system "#{bin}/asana-cli", "--version"
  end
end
