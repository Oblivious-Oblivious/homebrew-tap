class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.10.4.tar.gz"
  sha256 "7def9fb0ed7ec103968750b2e9dcbdacd37e8ea1bca5b17885f3dd32383205ec"
  license "MIT"

  depends_on "crystal" => :build

  def install
    system "shards", "build", "--release", "--no-debug"
    bin.install "bin/emeralds"
    bin.install_symlink bin/"emeralds" => "em"
  end

  test do
    assert_match "init", shell_output("#{bin}/em help")
  end
end
