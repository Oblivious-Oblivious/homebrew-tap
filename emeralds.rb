class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.14.2.tar.gz"
  sha256 "2457519e6a3da9a9c7507f02f4eec8db38bc7f420ef09e96ffbe347ab64077e9"
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
