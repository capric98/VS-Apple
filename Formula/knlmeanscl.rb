class Knlmeanscl < Formula
    desc "An optimized OpenCL implementation of the Non-local means de-noising algorithm"
    homepage "https://github.com/Khanattila/KNLMeansCL"
    url "https://github.com/Khanattila/KNLMeansCL/archive/refs/tags/v1.1.1.tar.gz"
    sha256 "9e0df80c64cc48a522f37e3f6e4edafe8eba22c0f78bcc8f54fbfbe9e30aa479"
    head "https://github.com/Khanattila/KNLMeansCL.git"
    license "GPL-2.0 License"
  
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
  