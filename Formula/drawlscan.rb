VERSION="v0.4.5"

class Drawlscan < Formula
  desc "URL shortener via bit.ly"
  option "without-completions", "Disable bash completions"
  depends_on "bash-completion@2" => :optional

  homepage "https://github.com/nagayon-935/DrawlScan"
  version VERSION
  license "MIT License"
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nagayon-935/DrawlScan/releases/download/v0.5.0/DrawlScan-darwin-amd64.tar.gz"
    sha256 "cd55a2577d70c464ee0948f14ff5d02814dee6c062c8c9199a630cd57d05374c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nagayon-935/DrawlScan/releases/download/v0.5.0/DrawlScan-darwin-arm64.tar.gz"
    sha256 "c5331b9fcca4b2783b0c331485342691dfe483d6ce389276394bcff035b67edc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nagayon-935/DrawlScan/releases/download/v0.5.0/DrawlScan-linux-amd64.tar.gz"
    sha256 "sha256:f37c2d7932dc16927e8971b04fada1fcdcd3f46169d6d247f651698115f10f80"
  end

  def install
    bin.install "drawlscan"
  end

  test do
    system "#{bin}/drawlscan --version"
  end
end