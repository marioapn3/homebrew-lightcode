class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.3.9/lightcode-darwin-aarch64"
    sha256 "aac6b7a41e6d8be0ae24eeb9bd829a04dfe698063e100ddcdd8a421985c7ecf7"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.3.9.tar.gz"
    sha256 "8664b0849fd85e5648393a091aedd6a0970e8970d306c8caf548dbc0ef9d93bf"
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
