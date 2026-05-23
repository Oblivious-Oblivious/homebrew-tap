class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "62acb184e5fb6d863957ad99eb0426275fbc5a9f5b68ce30ddb85d7fdbad7800"
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
