class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.1.0/lightcode-darwin-aarch64"
    sha256 "13f3d981213d0ddf70399821ebb55bb014e2afb1ce5ecc772f80f1dbbf8c497b"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "05474cb0726df38d2585b5a9cd54859d06786d7f0802502e3b274a1432b0603e"
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
