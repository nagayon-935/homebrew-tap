VERSION="v0.4.5"

class DrawlScan < Formula
  desc "URL shortener via bit.ly"
  option "without-completions", "Disable bash completions"
  depends_on "bash-completion@2" => :optional

  homepage "https://github.com/nagayon-935/DrawlScan"
  version VERSION
  license "MIT License"
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nagayon-935/DrawlScan/releases/download/v0.4.5/DrawlScan-darwin-amd64.tar.gz"
    sha256 "c4695ec0bef41a2b59f7e8902d9a981dc7b6af44718d69aa44618102f01cb080"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nagayon-935/DrawlScan/releases/download/v0.4.5/DrawlScan-darwin-arm64.tar.gz"
    sha256 "600e5dd90444c23bc223a255b9dccf8350c90afc89ba0049d92a29769921faaa"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nagayon-935/DrawlScan/releases/download/v0.4.5/DrawlScan-linux-amd64.tar.gz"
    sha256 "e40fff556859454aed3c1864ac81bae64d32eaa07bffc5ed9a2c69df6b5db814"
  end

  def install
    bin.install "drawlsccan"

    bash_completion.install "completions/bash/drawlscan" if build.with? "completions"
    zsh_completion.install  "completions/zsh/drawlscan"  if build.with? "completions"
    fish_completion.install "completions/fish/drawlscan" if build.with? "completions"
  end

  test do
    system "#{bin}/drawlscan --version"
  end
end