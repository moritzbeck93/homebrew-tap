class Slackpit < Formula
  desc "Slack message testing tool for developers - like Mailpit but for Slack"
  homepage "https://github.com/moritzbeck93/slackpit"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/moritzbeck93/slackpit/releases/download/v0.1.0/slackpit-darwin-arm64"
    sha256 "b73df3c5024b442c70d8a7204145d6cbe14f28674b32890ca85ef7ca58afcc52"
  end

  on_linux do
    url "https://github.com/moritzbeck93/slackpit/releases/download/v0.1.0/slackpit-linux-x64"
    sha256 "7ba8e2ffa95b9cc6f23c055697b802b2414f21365118835acbbd408373d7c18f"
  end

  def install
    binary = Dir["slackpit-*"].first
    bin.install binary => "slackpit"
  end

  service do
    run [opt_bin/"slackpit"]
    keep_alive true
    log_path var/"log/slackpit.log"
    error_log_path var/"log/slackpit.log"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/slackpit --version")
  end
end
