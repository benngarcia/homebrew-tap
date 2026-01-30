class Cwt < Formula
  desc "A TUI tool to manage Git Worktrees for AI coding agents"
  homepage "https://github.com/benngarcia/claude-worktree"
  url "https://github.com/benngarcia/claude-worktree/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a4907f9824cae479d55a5afda58961d49f2a8eae82a815c7cf03fbfdc2334a70"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "claude-worktree.gemspec"
    system "gem", "install", "claude-worktree-#{version}.gem"
    bin.install libexec/"bin/cwt"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/cwt", "--version"
  end
end
