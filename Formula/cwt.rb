class Cwt < Formula
  desc "A TUI tool to manage Git Worktrees for AI coding agents"
  homepage "https://github.com/bucket-robotics/claude-worktree"
  url "https://rubygems.org/downloads/claude-worktree-0.2.0.gem"
  sha256 "5610e4d50b22fa8c862760f49a5a456c6899858bc073c35e3591829bb5f1b817"
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
