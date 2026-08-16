class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.3.12/lightcode-darwin-aarch64"
    sha256 "a9b20b27d43e87522045aec13bef292a14259e48837b4b95ae87803af81304ee"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.3.12.tar.gz"
    sha256 "4203c75f7f5f6f50eea1ff3cfdfcfa972a372e906e5d61b61314599bba581e5b"
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
