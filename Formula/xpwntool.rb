class Xpwntool < Formula
  desc "Decrypts and patches iOS firmware files"
  homepage "https://github.com/xerub/xpwn"
  head "https://github.com/ROSeaboyer/xpwn.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "libpng"
  depends_on "libusb"

  def install
    ENV.cxx11

    # Clean potential stale dirs
    rm_r "build"

    system "cmake", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # Ensure bin directory exists
    (prefix/"bin").mkpath

    # Move tools from root of prefix into bin/
    mv prefix/"dmg",      prefix/"bin"
    mv prefix/"hdutil",   prefix/"bin"
    mv prefix/"hfsplus",  prefix/"bin"
    mv prefix/"ipsw",     prefix/"bin"/"xpwn-ipsw"
    mv prefix/"xpwntool", prefix/"bin"
  end

  test do
    system "#{bin}/xpwntool", "--help"
  end
end
