class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.10.13.tar.gz"
  sha256 "3dfd94bbdb97c59d28e2790f4a4a657fa68bc8a90f7aeb6662066ba51ac0b5e2"
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
