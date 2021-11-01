class Fmtconv < Formula
  desc "Format conversion tools for Vapoursynth"
  homepage "https://github.com/EleonoreMizo/fmtconv"
  url "https://github.com/EleonoreMizo/fmtconv/archive/refs/tags/r27.tar.gz"
  sha256 "32ddca10ee5a8e7e32b7fc15a9af2065a448a2db4e28dc8c31b6c02cafa38199"
  license "WTFPL"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  # depends_on "zimg" => :build
  # depends_on "vapoursynth" => :build

  def install
    Dir.chdir("build/unix")
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-silent-rules"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test HomeOfVapourSynthEvolution/fmtconv`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
