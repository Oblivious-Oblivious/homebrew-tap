class Emeralds < Formula
  desc "A package manager for C"
  homepage "https://github.com/Oblivious-Oblivious/Emeralds"
  url "https://github.com/Oblivious-Oblivious/Emeralds/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "93f487ef5000831f9809c6738344c8c71ec2988ace305674bc1c2fbb394e042d"
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
