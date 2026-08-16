class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.3.7/lightcode-darwin-aarch64"
    sha256 "a8dc25d9b26a4df3c5bf1c2512587a76f207dcf2c989459c8670cc081c7f72e4"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.3.7.tar.gz"
    sha256 "dadb17a92f3fd4faf9e060bb59e28ea01da27356a3a001035f4b1d31d39f3042"
    depends_on "rust" => :build
  end

  def install
    if Hardware::CPU.arm?
      bin.install "lightcode-darwin-aarch64" => "lightcode"
    else
      system "cargo", "install", "--path", "ligthcode-apps", "--locked", "--root", libexec
      bin.install libexec/"bin/lightcode"
    end
  end

  test do
    assert_match "lightcode", shell_output("#{bin}/lightcode --help")
  end
end
