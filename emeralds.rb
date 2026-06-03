class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "95d2c99606277b5a772a74b2aacd8e9f2aaa259b3249f7e46716fabfd6dfb945"
  license "MIT"

  depends_on "crystal" => :build

  def install
    ENV["EM_INSTALL_METHOD"] = "brew"
    system "shards", "build", "--release", "--no-debug"
    bin.install "bin/emeralds"
    bin.install_symlink bin/"emeralds" => "em"
  end

  test do
    assert_match "init", shell_output("#{bin}/em help")
  end
end
