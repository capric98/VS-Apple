class VapoursynthCtmf < Formula
    desc "CTMF filter for VapourSynth"
    homepage "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-CTMF"
    url "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-CTMF/archive/refs/tags/r5.tar.gz"
    sha256 "51fd89ddd65d5a314126028d99f1767968d5f4211127ab7e38b1f01f665efa44"
    license "GPL-3.0 License"
  
    depends_on "meson" => :build
    depends_on "ninja" => :build
    depends_on "cmake" => :build
    depends_on "zimg" => :build
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
  