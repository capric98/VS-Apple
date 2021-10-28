class Ffms2 < Formula
  desc "Libav/ffmpeg based source library and Avisynth plugin"
  homepage "https://github.com/FFMS/ffms2"
  url "https://github.com/FFMS/ffms2/archive/2.40.tar.gz"
  mirror "https://deb.debian.org/debian/pool/main/f/ffms2/ffms2_2.40.orig.tar.gz"
  sha256 "82e95662946f3d6e1b529eadbd72bed196adfbc41368b2d50493efce6e716320"
  # The FFMS2 source is licensed under the MIT license, but its binaries
  # are licensed under the GPL because GPL components of FFmpeg are used.
  license "GPL-2.0"
  revision 1
  head "https://github.com/FFMS/ffms2.git"

  option "with-customized-ffmpeg", "use customized ffmpeg"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "ffmpeg" if !build.with?('customized-ffmpeg')
  depends_on "homebrew-ffmpeg/ffmpeg/ffmpeg" if build.with?('customized-ffmpeg')

  resource "videosample" do
    url "https://samples.mplayerhq.hu/V-codecs/lm20.avi"
    sha256 "a0ab512c66d276fd3932aacdd6073f9734c7e246c8747c48bf5d9dd34ac8b392"
  end

  def install

    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --enable-avresample
      --prefix=#{prefix}
    ]

    system "./autogen.sh", *args
    system "make", "install"
    # system "ln", "-s", "#{prefix}/lib/libffms2.dylib", "#{HOMEBREW_PREFIX}/lib/libffms2.dylib"
  end

  test do
    # download small sample and check that the index was created
    resource("videosample").stage do
      system bin/"ffmsindex", "lm20.avi"
      assert_predicate Pathname.pwd/"lm20.avi.ffindex", :exist?
    end
  end
end