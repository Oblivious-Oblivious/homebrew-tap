class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "7cd9a157631979bbb5c745c01d611418b7d0fe31934820439f04cbe7a6b79373"
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
