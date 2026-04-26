class Lzssdec < Formula
  desc "Decrypts and patches iOS firmware files"
  homepage "https://github.com/arefttt/lzssdec"
  head "https://github.com/arefttt/lzssdec.git", branch: "master"

  def install
    mkdir "bin"
    system ENV.cxx, "lzssdec/main.cpp", "-o", "bin/lzssdec", "-std=gnu++11"
    bin.install "bin/lzssdec"
  end

  test do
    system "#{bin}/lzssdec", "--help"
  end
end
