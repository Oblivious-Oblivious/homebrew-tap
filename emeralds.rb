class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.11.3.tar.gz"
  sha256 "dadc5e7467487b0ce20cfd427c42b19802eb07310768a271860cde4b754cd49c"
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
