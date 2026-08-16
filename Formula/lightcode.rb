class Lightcode < Formula
  desc "Lightweight native Rust coding agent for the terminal"
  homepage "https://github.com/marioapn3/lightcode"
  license "MIT"

  on_arm do
    url "https://github.com/marioapn3/lightcode/releases/download/v0.3.17/lightcode-darwin-aarch64"
    sha256 "0b3e94c5cc1961705a0832c7c3b7c23640f6f4f44eab98f392d3272acf75f571"
  end

  on_intel do
    url "https://github.com/marioapn3/lightcode/archive/refs/tags/v0.3.17.tar.gz"
    sha256 "a8445d2fd544a4e8b50d65e0118c16a590a189fd0f4c2318b91661a7e48ba56d"
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
