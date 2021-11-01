class VapoursynthBm3d < Formula
  desc "BM3D denoising filter for VapourSynth"
  homepage "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-BM3D"
  url "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-BM3D/archive/refs/tags/r9.tar.gz"
  sha256 "3eb38c9e4578059042c96b408f5336b18d1f3df44896954713532cff735f1188"
  license "MIT License"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build
  depends_on "zimg" => :build
  depends_on "fftw" => :build
  depends_on "vapoursynth" => :build

  def install
    system "meson", "build/"
    system "ninja", "-C", "build/"
    system "meson", "install", "-C", "build/", "--destdir", "#{prefix}/lib"
    system "/bin/bash", "-c", "cp -r $(find -L . -name *.dylib) #{prefix}/lib"
    system "rm", "-rf", "#{prefix}/lib/opt"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test HomeOfVapourSynthEvolution/BM3D`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
