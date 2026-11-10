class SimHelper < Formula
  desc "Per-worktree iOS simulators and a shared Xcode compilation cache"
  homepage "https://github.com/ruby109/sim-helper"
  url "https://github.com/ruby109/sim-helper/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "aaa7c4d43f29f77340495e80286d352c4ad05de50505cba83e18a62f04320cb6"
  license "MIT"

  depends_on :macos
  depends_on "mobai-app/tap/simslim"
  depends_on xcode: "26.0"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/sim-helper"
  end

  test do
    assert_match "usage: sim-helper", shell_output("#{bin}/sim-helper help")
  end
end
