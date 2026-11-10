class SimHelper < Formula
  desc "Per-worktree iOS simulators and a shared Xcode compilation cache"
  homepage "https://github.com/ruby109/sim-helper"
  url "https://github.com/ruby109/sim-helper/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "560dba1dfdc3fad35b395051bd39f5629df3d90afbe1dc131866a119d40709b7"
  license "MIT"

  depends_on :macos
  depends_on "mobai-app/tap/simslim"
  depends_on xcode: "26.0"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/sim-helper"
    pkgshare.install "skills"
  end

  def caveats
    <<~EOS
      To give Claude Code the sim-helper skill:
        mkdir -p ~/.claude/skills
        ln -s #{opt_pkgshare}/skills/sim-helper ~/.claude/skills/sim-helper
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sim-helper --version")
    assert_match "sim acquire", shell_output("#{bin}/sim-helper help")
  end
end
