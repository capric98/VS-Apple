class Fmtconv < Formula
  desc "Format conversion tools for Vapoursynth"
  homepage "https://github.com/EleonoreMizo/fmtconv/"
  url "https://github.com/EleonoreMizo/fmtconv/archive/refs/tags/r26.tar.gz"
  sha256 "26748423bb10523c81cf13eea6006dad39cba9b69376ec035fc4a7e5c5fb24c1"
  license "WTFPL"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  # depends_on "vapoursynth" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--prefix=#{prefix}", "--disable-silent-rules"
    #   CXX      ../../src/fmtcl/Dither.lo
    # In file included from ../../src/fmtcl/Dither.cpp:29:
    # In file included from ./../../src/fmtcl/Dither.h:26:
    # In file included from ./../../src/conc/ObjPool.h:44:
    # In file included from ./../../src/conc/CellPool.h:33:
    # In file included from ./../../src/conc/LockFreeStack.h:45:
    # In file included from ./../../src/conc/AtomicPtrIntPair.h:40:
    # In file included from ./../../src/conc/Interlocked.h:132:
    # ./../../src/conc/Interlocked.hpp:267:4: error: invalid output constraint '+A' in asm
    #         :       "+A" (old)
    #                 ^
    # 1 error generated.
    # make: *** [../../src/fmtcl/Dither.lo] Error 1
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
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
