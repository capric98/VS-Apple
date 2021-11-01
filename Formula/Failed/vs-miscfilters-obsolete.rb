class VsMiscfiltersObsolete < Formula
    homepage "https://github.com/vapoursynth/vs-miscfilters-obsolete"
    url "https://github.com/vapoursynth/vs-miscfilters-obsolete/archive/refs/tags/R2.tar.gz"
    sha256 "53944adf718e9b9418ca62acc8d65f8f9aa59cd990d87da21f4594abbc8574c2"
    head "https://github.com/vapoursynth/vs-miscfilters-obsolete.git"
    license "LGPL-2.1 License"
  
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
  