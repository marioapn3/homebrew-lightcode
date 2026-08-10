class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.2.1/lightcode-darwin-aarch64"
    sha256 "643b9ea4a1ecadc97d19eae2c7b5ae1c9897d8527fb09bde83161a8dda6ebde7"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.2.1.tar.gz"
    sha256 "797cc166c3abafed67b5e41daa5277e181e1b3e848ffc0d3fd03ec18e23f8426"
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
