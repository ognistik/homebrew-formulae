class Macrowhisper < Formula
  desc "Automation helper application for Superwhisper dictation app"
  homepage "https://github.com/ognistik/macrowhisper"
  url "https://github.com/ognistik/macrowhisper/releases/download/v1.2.1/macrowhisper-1.2.1-macos.tar.gz"
  sha256 "6e73f9c158325d4a7c43663bc6ce56e068bc8534b14240fb31f5bc7d7c481bdd"
  license "GPL-3.0"
  head "https://github.com/ognistik/macrowhisper.git", branch: "main"

  depends_on :macos
  
  def install
    # Install the pre-built binary
    bin.install "macrowhisper"
  end

  test do
    # Test basic functionality
    assert_match "macrowhisper version 1.2.1", shell_output("#{bin}/macrowhisper --version")
    
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