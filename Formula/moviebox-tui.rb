class MovieboxTui < Formula
  VERSION = "0.1.24"
  MACOS_SHA256 = "75c40ece17cad31ea3032b99c4b93dde7a17923ef2878a17984e8925372c113e"
  LINUX_X64_SHA256 = "fc9d1b5e6473e32114a82b8f54732544f1cff651720558b0c7d972e79f1f5bc9"
  LINUX_ARM64_SHA256 = "d49c01d54236741b11b0357031b3addcef167c0caa82a55e69a985858e6931fd"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
