class Macrowhisper < Formula
  desc "Automation helper application for Superwhisper dictation app"
  homepage "https://github.com/ognistik/macrowhisper"
  # url "https://github.com/ognistik/macrowhisper/releases/download/v1.1.0/macrowhisper-1.1.0-macos.tar.gz"
  url "https://github.com/ognistik/macrowhisper/releases/download/untagged-1829e9f21d85b680ec99/macrowhisper-1.1.0-macos.tar.gz"
  sha256 "9c1b1f04959a7ac713f1f35a8eba5a4c97f6d2dfff193256fec15c5f44e2a6cd"
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
      
      2. Edit the configuration file to set your Superwhisper folder path
      
      3. Run macrowhisper in the background:
         macrowhisper
      
      Or install as a system service:
         macrowhisper --install-service
         macrowhisper --start-service
      
      For more information and documentation, visit:
      https://github.com/ognistik/macrowhisper
    EOS
  end
end 