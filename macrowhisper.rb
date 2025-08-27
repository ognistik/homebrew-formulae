class Macrowhisper < Formula
  desc "Automation helper application for Superwhisper dictation app"
  homepage "https://github.com/ognistik/macrowhisper"
  url "https://github.com/ognistik/macrowhisper/releases/download/v1.3.2/macrowhisper-1.3.2-macos.tar.gz"
  sha256 "1b2952f6050403f3b35e8c6e697f7957cfb4c76b3ffc725e951e9965893392f0"
  license "GPL-3.0"
  head "https://github.com/ognistik/macrowhisper.git", branch: "main"

  depends_on :macos
  
  def install
    # Install the pre-built binary
    bin.install "macrowhisper"
    
    # Install the JSON schema file for IDE integration
    share_dir = share/"macrowhisper"
    share_dir.mkpath
    share_dir.install "macrowhisper-schema.json"
  end

  test do
    # Test basic functionality
    assert_match "macrowhisper version 1.3.2", shell_output("#{bin}/macrowhisper --version")
    
    # Test help command
    assert_match "Usage: macrowhisper", shell_output("#{bin}/macrowhisper --help")
    
    # Test config management
    assert_match "Config path", shell_output("#{bin}/macrowhisper --get-config")
    
    # Test that schema file is installed
    schema_path = share/"macrowhisper/macrowhisper-schema.json"
    assert_predicate schema_path, :exist?, "JSON schema file should be installed"
  end

  def caveats
    <<~EOS
      To use macrowhisper:
      
      1. First, configure it by running:
        macrowhisper --reveal-config
      
      2. Verify correct Superwhisper folder path and/or other basic settings
      
      3. Install as a system service (to run in background):
        macrowhisper --start-service
      
      Or run macrowhisper directly:
        macrowhisper

      IMPORTANT: If upgrading, start or restart service
        macrowhisper --restart-service
      
      For more information and documentation, visit:
      https://by.afadingthought.com/macrowhisper
    EOS
  end
end 