class Cwt < Formula
  desc "A TUI tool to manage Git Worktrees for AI coding agents"
  homepage "https://github.com/benngarcia/claude-worktree"
  url "https://github.com/benngarcia/claude-worktree/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ead56e30cc1305bbb9ef7b28fcdf8e80614f6a0109199f735e86863552e86520"
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
