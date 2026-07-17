# typed: false
# frozen_string_literal: true

# One-release migration bridge for users of the legacy Formula.
class Auto < Formula
  desc "Agentic Development Kit for coding CLIs (the auto CLI)"
  homepage "https://github.com/Insajin/autopus-adk"
  version "0.50.71"
  license "MIT"
  deprecate! date: "2026-07-16", because: "is distributed as a signed cask", replacement_cask: "auto"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Insajin/autopus-adk/releases/download/v0.50.71/autopus-adk_0.50.71_darwin_amd64.tar.gz"
      sha256 "babce99376a647e801ea06d99f3575c87414551cbbeb77dfeed5cfa23851b964"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Insajin/autopus-adk/releases/download/v0.50.71/autopus-adk_0.50.71_darwin_arm64.tar.gz"
      sha256 "fbe9693d3517bdbaf92f230d7aa7561b728ba002749c2d06b6eef08170fed60b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Insajin/autopus-adk/releases/download/v0.50.71/autopus-adk_0.50.71_linux_amd64.tar.gz"
      sha256 "f150e713e2791116a2bc92e9893e202e5161c2f58fad3be55dfc08ba39f04b75"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Insajin/autopus-adk/releases/download/v0.50.71/autopus-adk_0.50.71_linux_arm64.tar.gz"
      sha256 "8f331702c5d98418b45203d0b7b604f52a36d9e08b2a7dcbb6d5f6fe712ef878"
    end
  end

  def install
    bin.install "auto"
  end

  def caveats
    <<~EOS
      This Formula is a one-release migration bridge. Migrate to the signed Cask:
        brew uninstall --formula auto
        brew install --cask Insajin/autopus/auto
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/auto version")
  end
end
