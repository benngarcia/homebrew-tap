class Cwt < Formula
  desc "A TUI tool to manage Git Worktrees for AI coding agents"
  homepage "https://github.com/bucket-robotics/claude-worktree"
  url "https://rubygems.org/downloads/claude-worktree-0.1.4.gem"
  sha256 "ed5480ce316a30d0f42c1c380803a4fec9a644069db82aa324efe54b3c6b1d8f"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec
    system "gem", "install", "--no-document", cached_download
    bin.install libexec/"bin/cwt"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"], GEM_PATH: ENV["GEM_PATH"])
  end

  test do
    system "#{bin}/cwt", "--version"
  end
end
