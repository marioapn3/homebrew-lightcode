class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.3.2/lightcode-darwin-aarch64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.3.2.tar.gz"
    sha256 "4de6bfee83c896d63bc28cf168e461082ae50efc097fd9a2c53352a1a669cfc8"
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
