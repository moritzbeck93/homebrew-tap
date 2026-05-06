class Slackpit < Formula
  desc "Slack message testing tool for developers - like Mailpit but for Slack"
  homepage "https://github.com/moritzbeck93/slackpit"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moritzbeck93/slackpit/releases/download/v0.1.0/slackpit-darwin-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/moritzbeck93/slackpit/releases/download/v0.1.0/slackpit-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/moritzbeck93/slackpit/releases/download/v0.1.0/slackpit-linux-x64"
    sha256 "PLACEHOLDER"
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
