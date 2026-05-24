class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.10.3.tar.gz"
  sha256 "4b000e9a79da2f6871cd0d9f13f61b6b9b8c18bddc8dce98ce817f9e4ad9417a"
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
