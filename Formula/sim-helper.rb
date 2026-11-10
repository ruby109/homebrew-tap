class SimHelper < Formula
  desc "Per-worktree iOS simulators and a shared Xcode compilation cache"
  homepage "https://github.com/ruby109/sim-helper"
  url "https://github.com/ruby109/sim-helper/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "24bcc9e86af457b372c16121d3781e57da5147b04b2ac7dd7eed11262c6a1736"
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
      To teach Claude Code and Codex to use sim-helper:
        sim-helper skill install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sim-helper --version")
    assert_match "sim acquire", shell_output("#{bin}/sim-helper help")
  end
end
