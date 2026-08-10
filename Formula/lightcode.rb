class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "05474cb0726df38d2585b5a9cd54859d06786d7f0802502e3b274a1432b0603e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", "ligthcode-apps", "--locked", "--root", libexec
    bin.install libexec/"bin/lightcode"
  end

  test do
    assert_match "lightcode", shell_output("#{bin}/lightcode --help")
  end
end
