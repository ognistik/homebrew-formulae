class Macrowhisper < Formula
  desc "Automation helper application for Superwhisper dictation app"
  homepage "https://github.com/ognistik/macrowhisper"
  url "https://github.com/ognistik/macrowhisper/releases/download/v1.1.0/macrowhisper-1.1.0-macos.tar.gz"
  sha256 "84f3c355bc615d596621b17499b6a77de2e3a1c42225eacd0a8add7af67ab36b"
  license "GPL-3.0"
  head "https://github.com/ognistik/macrowhisper.git", branch: "main"

  depends_on :macos
  
  def install
    # Install the pre-built binary
    bin.install "macrowhisper"
  end

  test do
    # Test basic functionality
    assert_match "macrowhisper version 1.1.0", shell_output("#{bin}/macrowhisper --version")
    
    # Test help command
    assert_match "Usage: macrowhisper", shell_output("#{bin}/macrowhisper --help")
    
    # Test config management
    assert_match "Config path", shell_output("#{bin}/macrowhisper --get-config")
  end

  def caveats
    <<~EOS
      To use macrowhisper:
      
      1. First, configure it by running:
        macrowhisper --reveal-config
      
      2. Verify correct Superwhisper folder path and/or other basic settings
      
      3.Install as a system service (to run in background):
        macrowhisper --start-service
      
      Or run macrowhisper directly:
        macrowhisper

      IMPORTANT: If upgrading, start or restart service
        macrowhisper --restart-service
      
      For more information and documentation, visit:
      https://github.com/ognistik/macrowhisper
    EOS
  end
end 