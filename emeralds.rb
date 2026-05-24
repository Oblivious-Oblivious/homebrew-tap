class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.10.5.tar.gz"
  sha256 "0b50dd929a0b1103501e5957b7d4f0141e2e97d8b6221bd57799aeac88f8ca28"
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
