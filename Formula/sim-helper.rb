class SimHelper < Formula
  desc "Per-worktree iOS simulators and a shared Xcode compilation cache"
  homepage "https://github.com/ruby109/sim-helper"
  url "https://github.com/ruby109/sim-helper/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5fd5008e45b727d4a3f99465b90f97b9ff2e675b298efbf95c1bb823b5180cba"
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
