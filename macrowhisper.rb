class Macrowhisper < Formula
  desc "Automation helper application for Superwhisper dictation app"
  homepage "https://github.com/ognistik/macrowhisper"
  url "https://github.com/ognistik/macrowhisper/releases/download/v2.1.0/macrowhisper-2.1.0-macos.tar.gz"
  sha256 "85670f4d0a323055c8a0bea1f35f3ffb23c712c987d8b545655e7bfe2a84a4dd"
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
    assert_match "macrowhisper version 2.1.0", shell_output("#{bin}/macrowhisper --version")
    
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